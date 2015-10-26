/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS6320ProjectCSUEB;

import CS6320ProjectCSUEBModels.User;
import CS6320ProjectCSUEBModels.UserCart;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gagandeep
 */
public class makeOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int[] productsArray = null;
        String emailAddress = null;
        HttpSession session = request.getSession();

        UserCart userCart = (UserCart) session.getAttribute("userCart");
        User userInfo = (User) session.getAttribute("userInfo");

        if (userCart != null && userInfo != null) {
            productsArray = userCart.getProductsArray();
            emailAddress = userInfo.getEmailAddress();
        }

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        String user = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3306/ComputerCentral";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            myConn = (Connection) DriverManager.getConnection(url, user, password);
            myStmt = (Statement) myConn.createStatement();

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        if (productsArray != null && emailAddress != null) {
            int random = (int) (Math.random() * 6789 + 5893);
            String query = "INSERT INTO user_Order (emailID, orderNumber, 2GB_RAM, 4GB_RAM, 8GB_RAM, 16GB_RAM, 128GB_SSD, 256GB_SSD, 512GB_SSD, 1TB_SSD) "
                    + "VALUES ('" + emailAddress + "', "
                    + "'" + random + "', "
                    + "'" + productsArray[0] + "', "
                    + "'" + productsArray[1] + "', "
                    + "'" + productsArray[2] + "', "
                    + "'" + productsArray[3] + "', "
                    + "'" + productsArray[4] + "', "
                    + "'" + productsArray[5] + "', "
                    + "'" + productsArray[6] + "', "
                    + "'" + productsArray[7] + "')";

            int value = myStmt.executeUpdate(query);

            session.setAttribute("random", random);
        }

        myStmt.close();
        myConn.close();

        session.setAttribute("userCart", null);
        session.setAttribute("userInfo", null);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/orderComplete.jsp");
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(makeOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(makeOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

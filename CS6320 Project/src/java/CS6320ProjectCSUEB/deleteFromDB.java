/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS6320ProjectCSUEB;

import CS6320ProjectCSUEBModels.User;
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
public class deleteFromDB extends HttpServlet {

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

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        String user = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3306/ComputerCentral";
        String query = null;
        String username = null;
        HttpSession session = request.getSession();
        User userInfo = (User) session.getAttribute("userInfo");
        username = userInfo.getUserID();

        try {

            Class.forName("com.mysql.jdbc.Driver");

            myConn = (Connection) DriverManager.getConnection(url, user, password);
            myStmt = (Statement) myConn.createStatement();

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(loginValidation.class.getName()).log(Level.SEVERE, null, ex);
        }

        query = "SELECT * FROM user_Data WHERE userID = '" + username + "'";
        myRs = myStmt.executeQuery(query);
        while (myRs.next()) {

            if (username.equals(myRs.getString(1))) {

                query = "DELETE FROM user_Data WHERE userID = '" + username + "'";
                int count = myStmt.executeUpdate(query);
                session.setAttribute("userInfo", null);
                session.setAttribute("userCart", null);

            }

            myRs.close();
            myStmt.close();
            myConn.close();

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/beginPage.jsp");
            rd.forward(request, response);

        }
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
            Logger.getLogger(deleteFromDB.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(deleteFromDB.class.getName()).log(Level.SEVERE, null, ex);
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

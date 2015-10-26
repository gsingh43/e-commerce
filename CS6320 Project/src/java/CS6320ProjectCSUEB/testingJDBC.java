/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS6320ProjectCSUEB;

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

/**
 *
 * @author gagandeep
 */
public class testingJDBC extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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

        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String zipCode = request.getParameter("zipCode");
        String phoneNumber = request.getParameter("phoneNumber");
        String emailAddress = request.getParameter("emailAddress");
        String query = "SELECT * FROM user_Data WHERE userID = '" + username + "'";
        String query1 = "SELECT * FROM user_Data WHERE emailAddress = '" + emailAddress + "'";
        String redirect = "/loginPage.jsp";
        String insertStmt = null;
        String error1 = null;
        String error2 = null;
        System.out.println("User name +++ " + username);
        myRs = myStmt.executeQuery(query);
        while (myRs.next()) {

            if (myRs.getString(1).equals(username)) {
                redirect = "/signUpPage.jsp";
                error1 = "USER ID ALREADY EXISTS, PLEASE CHOOSE ANOTHER!";
            }

        }
        myRs = myStmt.executeQuery(query1);
        while (myRs.next()) {
            if (myRs.getString("emailAddress").equals(emailAddress)) {
                redirect = "/signUpPage.jsp";
                error2 = "THERE IS ALREADY A USER ASSOCIATED WITH THE EMAIL YOU HAVE ENTERED!";
            }
        }
        if (error1 == null && error2 == null) {
            insertStmt = "INSERT INTO user_Data (userID, pword, fullName, address, city, zipCode, phoneNumber, emailAddress) "
                    + "VALUES ('" + username + "', "
                    + "'" + pwd + "', "
                    + "'" + fullName + "', "
                    + "'" + address + "', "
                    + "'" + city + "', "
                    + "'" + zipCode + "', "
                    + "'" + phoneNumber + "', "
                    + "'" + emailAddress + "')";

            int rowCount = myStmt.executeUpdate(insertStmt);
            System.out.println("NUMBER FROM ROWCOUNT" + rowCount);
        }

        myRs.close();
        myStmt.close();
        myConn.close();

        request.setAttribute("error1", error1);
        request.setAttribute("error2", error2);

        RequestDispatcher rd = getServletContext().getRequestDispatcher(redirect);
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
            Logger.getLogger(testingJDBC.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(testingJDBC.class.getName()).log(Level.SEVERE, null, ex);
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

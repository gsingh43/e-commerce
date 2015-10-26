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
public class updateToDB extends HttpServlet {

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

        HttpSession session = request.getSession();
        User userInfo = (User) session.getAttribute("userInfo");

        String errorUsername = "**The username that you have entered already belongs to another existing user** Try Again!";
        String errorEmail = "**The email that you have entered already belongs to another existing user** Try Again!";

        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String zipCode = request.getParameter("zipCode");
        String phoneNumber = request.getParameter("phoneNumber");
        String emailAddress = request.getParameter("emailAddress");
        String updateStmt = "UPDATE user_Data SET "
                + "userID = '" + username + "', "
                + "pword = '" + pwd + "', "
                + "fullName = '" + fullName + "', "
                + "address = '" + address + "', "
                + "city = '" + city + "', "
                + "zipCode = '" + zipCode + "', "
                + "phoneNumber = '" + phoneNumber + "', "
                + "emailAddress = '" + emailAddress + "' "
                + "WHERE userID = '" + userInfo.getUserID() + "'";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            myConn = (Connection) DriverManager.getConnection(url, user, password);
            myStmt = (Statement) myConn.createStatement();

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(updateToDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "SELECT * FROM user_Data WHERE userID != '" + userInfo.getUserID() + "'";
        myRs = myStmt.executeQuery(query);

        while (myRs.next()) {

            if (username.equals(myRs.getString(1)) && emailAddress.equals(myRs.getString(8))) {

                myRs.close();
                myStmt.close();
                myConn.close();

                request.setAttribute("errorUsername", errorUsername);
                request.setAttribute("errorEmail", errorEmail);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateProfile.jsp");
                rd.forward(request, response);

            } 
            else if (username.equals(myRs.getString(1))) {

                myRs.close();
                myStmt.close();
                myConn.close();

                request.setAttribute("errorUsername", errorUsername);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateProfile.jsp");
                rd.forward(request, response);

            }
            else if (emailAddress.equals(myRs.getString(8))){
                
                myRs.close();
                myStmt.close();
                myConn.close();

                request.setAttribute("errorEmail", errorEmail);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateProfile.jsp");
                rd.forward(request, response);
                
            }
        }

        int rowCount = myStmt.executeUpdate(updateStmt);

        if (rowCount > 0) {

            userInfo.setUserID(username);
            userInfo.setPword(pwd);
            userInfo.setFullName(fullName);
            userInfo.setAddress(address);
            userInfo.setCity(city);
            userInfo.setZipCode(zipCode);
            userInfo.setPhoneNumber(phoneNumber);
            userInfo.setEmailAddress(emailAddress);

            session.setAttribute("userInfo", null);
            myRs.close();
            myStmt.close();
            myConn.close();

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/beginPage.jsp");
            rd.forward(request, response);

        } else {
            myRs.close();
            myStmt.close();
            myConn.close();

            request.setAttribute("errorUsername", errorUsername);
            request.setAttribute("emailAddress", emailAddress);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateProfile.jsp");
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
            Logger.getLogger(updateToDB.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updateToDB.class.getName()).log(Level.SEVERE, null, ex);
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

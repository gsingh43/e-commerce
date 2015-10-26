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
public class loginValidation extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        session.setAttribute("userInfo", null);
        session.setAttribute("userCart", null);
        String username = request.getParameter("username");
        String pwd = request.getParameter("pword");

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        String invalid = "INVALID USERNAME OR PASSWORD!";
        String user = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3306/ComputerCentral";
        String redirect = "/loginPage.jsp";
        User userInfo = null;
        

        try {

            Class.forName("com.mysql.jdbc.Driver");

            myConn = (Connection) DriverManager.getConnection(url, user, password);
            myStmt = (Statement) myConn.createStatement();
            userInfo = new User();

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(loginValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
        String query = "SELECT * FROM user_Data WHERE userID = '" + username + "'";
        myRs = myStmt.executeQuery(query);
        while (myRs.next()) {

            if (username.equals(myRs.getString("userID")) && pwd.equals(myRs.getString("pword"))) {

                redirect = "/afterLogin.jsp";
                
                invalid = null;
                
                userInfo.setUserID(myRs.getString("userID"));
                userInfo.setPword(myRs.getString("pword"));
                userInfo.setFullName(myRs.getString("fullName"));
                userInfo.setAddress(myRs.getString("address"));
                userInfo.setCity(myRs.getString("city"));
                userInfo.setZipCode(myRs.getString("zipCode"));
                userInfo.setPhoneNumber(myRs.getString("phoneNumber"));
                userInfo.setEmailAddress(myRs.getString("emailAddress"));
                
                session.setAttribute("userInfo", userInfo);
               

                break;

            }

        }

        myRs.close();
        myStmt.close();
        myConn.close();
        
        
        request.setAttribute("invalid", invalid);
        
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
            Logger.getLogger(loginValidation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginValidation.class.getName()).log(Level.SEVERE, null, ex);
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

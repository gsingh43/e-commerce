/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS6320ProjectCSUEB;

import CS6320ProjectCSUEBModels.UserCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.NumberFormat;
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
public class shopToControl0 extends HttpServlet {

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
            throws ServletException, IOException {
        int[] productArray = new int[8];
        float totalPrice = 0;
        UserCart userCart = new UserCart();
        HttpSession session = request.getSession();

        String transferURL = (String) request.getParameter("transferURL");
        productArray[0] = Integer.parseInt(request.getParameter("Ram1"));
        productArray[1] = Integer.parseInt(request.getParameter("Ram2"));
        productArray[2] = Integer.parseInt(request.getParameter("Ram3"));
        productArray[3] = Integer.parseInt(request.getParameter("Ram4"));
        productArray[4] = Integer.parseInt(request.getParameter("Ssd5"));
        productArray[5] = Integer.parseInt(request.getParameter("Ssd6"));
        productArray[6] = Integer.parseInt(request.getParameter("Ssd7"));
        productArray[7] = Integer.parseInt(request.getParameter("Ssd8"));
        
        if(productArray[0] > 0){
            totalPrice += productArray[0] * 39.99;
        }
        if(productArray[1] > 0){
            totalPrice += productArray[1] * 59.99;
        }
        if(productArray[2] > 0){
            totalPrice += productArray[2] * 79.99;
        }
        if(productArray[3] > 0){
            totalPrice += productArray[3] * 99.99;
        }
        if(productArray[4] > 0){
            totalPrice += productArray[4] * 69.99;
        }
        if(productArray[5] > 0){
            totalPrice += productArray[5] * 109.99;
        }
        if(productArray[6] > 0){
            totalPrice += productArray[6] * 199.99;
        }
        if(productArray[7] > 0){
            totalPrice += productArray[7] * 429.99;
        }
        BigDecimal roundfinalPrice = new BigDecimal(totalPrice).setScale(2,BigDecimal.ROUND_HALF_UP);
        userCart.setTotalPrice(roundfinalPrice);
        userCart.setProductsArray(productArray);
        
        session.setAttribute("userCart", userCart);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher(transferURL);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

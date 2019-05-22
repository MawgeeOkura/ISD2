/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oms.DAO.DBManager;
/**
 *
 * @author Max.Okura
 */
@WebServlet(name = "RegisterServelet", urlPatterns = {"/RegisterServelet"})
public class RegisterServelet extends HttpServlet {
    
     private DBManager manager;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         this.manager = new DBManager();
        
      
         String firstname = request.getParameter("firstname");
         String lastname = request.getParameter("lastname");
         String password = request.getParameter("password");
         String email    = request.getParameter("email");
         String phone    = request.getParameter("phone");
         
         try {
             manager.addCustomer(firstname, lastname, password, email, phone, lastname, email);
             
              RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");  
                rd.forward(request, response);  
         } catch (SQLException ex) {
             Logger.getLogger(RegisterServelet.class.getName()).log(Level.SEVERE, null, ex);
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

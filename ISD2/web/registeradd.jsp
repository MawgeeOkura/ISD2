<%-- 
    Document   : registeradd
    Created on : 21/05/2019, 11:47:13 AM
    Author     : Mawgee.Okura
--%>

<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Action</title>
    </head>
    <body>

        
        
        <%
            
            DBManager manager = (DBManager)session.getAttribute("manager");
            String firstname = request.getParameter("firstname");
            String  lastname = request.getParameter("lastname");
            String  email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String createdate = "2019-5-21";
            String paymentdetailsid = "1";
            
            
            Customer customer = manager.findCustomer(email); //difference between customer and register is that anyone can be registered not everyone can be customer
            
            if (customer == null) {
                
                manager.addCustomer(firstname,lastname ,email , password ,phone , createdate , paymentdetailsid);
                response.sendRedirect("index1.jsp");  
               
            }else{
                 response.sendRedirect("login.jsp");  
                                             
            }             
                %>
        
       
       
        
     
        
    </body>
</html>

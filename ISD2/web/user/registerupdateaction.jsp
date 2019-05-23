<%-- 
    Document   : registerupdateaction
    Created on : 24/05/2019, 6:55:12 AM
    Author     : Mawgee-PC
--%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register update </title>
    </head>
    <body>
         
          <%
            Register updateuser = (Register) session.getAttribute("loggedin");
               
            DBManager manager = (DBManager)session.getAttribute("db");
            
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = updateuser.getEmail();
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String createdate = "2019-5-21";
            String paymentdetailsid = "1";
            Customer customer = manager.findCustomer(email); //difference between customer and register is that anyone can be registered not everyone can be customer
            
            int ID = customer.getId();
           
            if (customer != null) {
                
                manager.updateCustomer(ID , firstname , lastname , password , phone , createdate , paymentdetailsid);
                response.sendRedirect("updateregister.jsp");  
               
            }else{
                 response.sendRedirect("login.jsp"); 
                 session.setAttribute("accountexists", customer);
                                             
            }             
                %>
            
        
        
        <h1>Hello World!</h1>
    </body>
</html>

<%-- 
    Document   : registeradd
    Created on : 21/05/2019, 11:47:13 AM
    Author     : Mawgee.Okura
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Add Action</title>
    </head>
    <body>

        
        
        <%
            DateFormat currentdate = new SimpleDateFormat("yyyy-MM-dd"); //derby database has no datetime format
            Date date = new Date();
            DBManager manager = (DBManager)session.getAttribute("db");
            String firstname = request.getParameter("firstname");
            String  lastname = request.getParameter("lastname");
            String  email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phonenumber");
            String createdate = currentdate.format(date); 
            String paymentdetailsid = "1";
            
            
            Customer customer = manager.findCustomer(email); //difference between customer and register is that anyone can be registered not everyone can be customer
            
            if (customer == null) {
                
                manager.addCustomer(firstname,lastname ,password , email ,phone , createdate , paymentdetailsid);
                response.sendRedirect("index1.jsp");  
               
            }else{
                 response.sendRedirect("login.jsp"); 
                 session.setAttribute("accountexists", customer);
                                             
            }             
                %>
        
       
       
        
     
        
    </body>
</html>

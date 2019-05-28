<%-- 
    Document   : registerviewaction
    Created on : 24/05/2019, 9:51:06 AM
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
        <title>Register View Action</title>
    </head>
    <body>
        
    <!-- checks if user is logged in. If not then redirect user -->     
        
           <% 
     Register updateuser = (Register) session.getAttribute("loggedin");
            
     if(updateuser.getEmail() != "error"){
         
      
         response.sendRedirect("registerview.jsp");  
     } else {
         
        response.sendRedirect("registernotloggedin.jsp");   
     }


        
        %> 
        
        
    </body>
</html>

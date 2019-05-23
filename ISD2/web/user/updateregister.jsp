<%-- 
    Document   : registerview
    Created on : 14/05/2019, 9:55:54 AM
    Author     : Mawgee.Okura
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updated register details </title>
        
         <%  
          
            Register viewuser = (Register) session.getAttribute("loggedin");
            DBManager manager = (DBManager)session.getAttribute("db");
             Customer customer = manager.findCustomer(viewuser.getEmail());
            %>     
  
           
            
      <%
        String firstname = customer.getFirstName(); 
        String lastname  = customer.getLastName();
        String email     = customer.getEmail();
        String password  = customer.getPassword();
        String phone     = customer.getPhone();
         %>
            
 <%@include file="../footer.jsp"%>
    </head>
    <body>
        <h1> You have successfully updated account details</h1> </br> 
        <h2> New account details </h2> 
       
        
        <div class="container">
            
            <label> First Name: </label> <%= firstname %> </br>
            <label> Last Name: </label> <%= lastname %> </br>
            <label> Email: </label> <%= email %> </br>
            <label> Phone: </label> <%= phone %>  </br>
            
            
            </br>
         
      
        </div> 
    </body>
</html>

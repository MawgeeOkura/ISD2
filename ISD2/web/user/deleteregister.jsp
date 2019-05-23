<%-- 
    Document   : deleteregister
    Created on : 15/05/2019, 11:10:22 AM
    Author     : Max.Okura
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account </title>
    </head>
    <body>
        
          
            
            
              <%  
          
            Register viewuser = (Register) session.getAttribute("loggedin");
            DBManager manager = (DBManager)session.getAttribute("db");
             Customer customer = manager.findCustomer(viewuser.getEmail());
             manager.deleteCustomer(customer.getId());
            %>  
            
             <%  
            session.invalidate();
            %>    
            
            <% response.setHeader("Refresh", "5;url=../index1.jsp"); %>.
            
        
        
        <h1>Your account has been deleted</h1>
        
        
        <div>
            
            <p> You will be redirected to home page in 5 seconds. </p>
            </br>
            
            <p> If nothing happens click <a href="../index1.jsp">here</a> to go back to home page </p>
            
            
        </div>
        
        
        
    </body>
</html>

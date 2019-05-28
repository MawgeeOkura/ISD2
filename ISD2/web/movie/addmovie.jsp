<%-- 
    Document   : addmovie
    Created on : 08/05/2019, 9:51:24 AM
    Author     : Mawgee.Okura
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
      <%  
            DBManager manager = (DBManager)session.getAttribute("db");
            Register user = (Register) session.getAttribute("loggedin");
           %>
    <%
        String email = user.getEmail();
        
        if(!manager.validateRole(3,email)){
            
             response.sendRedirect("../notloggedin.jsp"); 
        }
        
        
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%-- 
    Document   : registerview
    Created on : 14/05/2019, 9:55:54 AM
    Author     : Mawgee.Okura
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updated register details </title>
        
         <%  
          
            Register viewuser = (Register) session.getAttribute("loggedin");
            
            %>     
  
            
     <% 
    if(request.getParameter("firstname") != null){
        
        viewuser.setFirstname(request.getParameter("firstname"));
        
    }%>
    
     <% 
    if(request.getParameter("lastname") != null){
        
        viewuser.setLastname(request.getParameter("lastname"));
        
    }%>
    
    <% 
    if(request.getParameter("email") != null){
  
        viewuser.setEmail(request.getParameter("email"));
        
    }%>
    
    
     <%
    if(request.getParameter("password") != null){
       
       viewuser.setPassword(request.getParameter("password"));
       
    }%>
    
      <% 
    if(request.getParameter("phonenumber") != null){
        viewuser.setPhone(Integer.parseInt(request.getParameter("phonenumber")));
    }%>
            
      <%
        String firstname = viewuser.getFirstname(); 
        String lastname  = viewuser.getLastname();
        String email     = viewuser.getEmail();
        String password  = viewuser.getPassword();
        int phone        = viewuser.getPhone();
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

<%-- 
    Document   : index1
    Created on : 13/05/2019, 1:46:19 PM
    Author     : Mawgee.Okura
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="oms.model.*" %>
<link href="CSS.css" rel="stylesheet" type="text/css">

<!-- JSP retrieves data when user logins or registers. variables are set to 'error' 
so that when index page is run, a null pointer exception won't occur since the object is not empty-->
<!DOCTYPE html>
   <% String firstname;
    if(request.getParameter("firstname") == null){
        firstname = "error";}
    else{
        firstname = request.getParameter("firstname");
    }%>
    
     <% String lastname;
    if(request.getParameter("lastname") == null){
        lastname = "error";}
    else{
        lastname = request.getParameter("lastname");
    }%>
    
    <% String email;
    if(request.getParameter("email") == null){
        email = "error";}
    else{
        email = request.getParameter("email");
    }%>
     <% String password;
    if(request.getParameter("password") == null){
        password = "error";}
    else{
        password = request.getParameter("password");
    }%>
    
     <% int phone;
    if(request.getParameter("phonenumber") == null){
        phone = 0;}
    else{
        phone = Integer.parseInt(request.getParameter("phonenumber"));
    }%>
   

   
   <!-- Creation of session -->     
<%
            oms.model.Register loggedin = new oms.model.Register(firstname,lastname,email,password,phone);
            session.setAttribute("loggedin", loggedin);
            
            
            %>
    <!-- Inclusion of header and footer -->  
    
<jsp:include page="headerindex.jsp" />
<jsp:include page="footer.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to OSMOA System</title>
    </head>
    <body>
   

          <h1> Welcome to Online Movie Ordering Application (OMOA) System</h1>
         
          <br> 
          <h2>About the system </h2>
          <p> Enjoy the ability to order the latest movies.  </p>
          
          <h2> <u> Current Available Movies </u> </h2>
        
        <table>
            
            <tr>
                <th> Movie Title </th>
                <th> Description </th>
                <th> Price </th>
                <th> Select </th> 
            </tr>
            
            <tr>
                <th> Avengers End Game </th>
                <th> The Final Battle </th>
                <th> $200.00 </th> 
                <th> <button> Select </button> </th>
                
                
            </tr>
            
            
            <tr>
                <th> <a href=""> More Movies </a> </th>
                
            </tr>
            
        </table>     
        
        
    </body>
</html>


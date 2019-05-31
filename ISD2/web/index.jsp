<%-- 
    Document   : index1
    Created on : 13/05/2019, 1:46:19 PM
    Author     : Mawgee.Okura
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="oms.Model.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="oms.DAO.*" %>
<link href="CSS.css" rel="stylesheet" type="text/css">

<!-- JSP retrieves data when user logins or registers. variables are set to 'error' 
so that when index page is run, a null pointer exception won't occur since the object is not empty-->
<!DOCTYPE html>
    <%
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        ArrayList<Movie> movies = null;
        String message="didn't work";
        String message2 ="didn't work";
        if (db != null) {
            session.setAttribute("db", db);
             message="db connected";
//            movies = db.getAllMovies();
            if (movies != null) {
                session.setAttribute("highestRatedMovies", movies);
            }
        }
        
      
        session.setAttribute("selectedMovie", null);
        session.setAttribute("error", null);
        session.setAttribute("name", null);
        session.setAttribute("description", null);
        session.setAttribute("genre", null);
        session.setAttribute("price", null);
        session.setAttribute("numberOfCopies", null);
        session.setAttribute("status", null);
    %>
    
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
   
    <%  int phone;
    if(request.getParameter("phone") == null){
        phone = 0;}
    else{
        phone = Integer.parseInt(request.getParameter("phone"));
    }%>
        
    <%
         Customer customer = db.findCustomer(email);
       if(customer != null){
           
           message2= customer.getEmail();
       } else {
           message2 = "customer not found";
       }
        %>
   
   <!-- Creation of session -->     
<%
            oms.Model.Register loggedin = new oms.Model.Register(firstname,lastname,email,password,phone);
            session.setAttribute("loggedin", loggedin);
            
            
            %>
    <!-- Inclusion of header and footer -->  
    
<jsp:include page="header.jsp" />
<jsp:include page="footer.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to OSMOA System</title>
    </head>
    <body>
   <%= message %>
<%= message2 %>
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
        
           <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>


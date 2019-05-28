<%-- 
    Document   : registerview
    Created on : 14/05/2019, 9:55:54 AM
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

 <!-- declare variables and connect to database and session --> 
       <%!  
             String firstname;
             String lastname;
             String phone;
             String password;
             String message1;
           %> 
        
        <%  
            DBManager manager = (DBManager)session.getAttribute("db");
            Register updateuser = (Register) session.getAttribute("loggedin");
           %>
           
           <%  String email = updateuser.getEmail();
               Customer customer = manager.findCustomer(email);     
            %> 
            
       <!-- If Customer is logged in then retrieve register details -->            
         <%
                if(updateuser.getEmail() != "error"){
                    message1  = "";
                    firstname = customer.getFirstName();
                    lastname  = customer.getLastName();
                    email     = customer.getEmail();
                    phone     = customer.getPhone();
                    password  = customer.getPassword();
                } 
                else{
                    message1 ="Please login to update or delete details";
                    firstname = "";
                    lastname = "";
                    email    = "";
                    phone    = "";
                    password = "";
                   
                   
                }
                
                
                %>
                
                
   
            
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Update </title>
   
      
    </head>
    
    <!-- Javascript for popup message  --> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
    <script type="text/javascript">
      $(function () {
            $("#delete").click(function (e) {
                if (confirm("Are you sure you want to delete account?")) {
                    
                    window.location.replace("deleteregister.jsp");
                } else {
                   
                }
            });
        });  
    </script>  
    
    
    <!-- Displays register details. Disable ability to update email as that is its username --> 
    <body onload="checkdisable()">
        
        <h2>Update Account Details </h2>
        
        <b><p><%= message1 %>  </p></b> </br>
        
        <div id="updatedelete" class="container">
            
         <form action="registerupdateaction.jsp" method="POST">
            <tr>
                <td> <label> Email: </label> </td>
                <td><input type="text" name="email" value="<%=email%>" disabled > <br> <br> </td>
            </tr>
            
            <tr>
                <td> <label> First Name: </label> </td> 
                <td> <input type="text" name="firstname" value="<%=firstname%>" > <br> <br> </td>
            </tr>
            
            <tr>
                <td> <label> Last Name: </label> </td> 
                <td> <input type="text" name="lastname" value="<%=lastname%>"> <br> <br> </td>
            </tr>
           
            
            <tr>
                <td> <label> Password:</label> </td>
                <td> <input type="password" name="password" value="<%=password%>" > <br> <br>  </td> 
            
            </tr>
            
             <tr>
                <td> <label> Phone Number: </label> </td> 
                <td> <input type="text" name="phonenumber" value="<%=phone%>"><br> <br> </td>
            </tr>
          
        
            <input id="update" type="submit" name="submit" value="update" >  <input type="button" id="delete" value="Delete account"></a>
        </form>
            
     
        </div> 
    </body>
</html>

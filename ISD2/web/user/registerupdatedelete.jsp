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
    <body onload="checkdisable()">
        
        <h2>Update Account Details </h2>
        
        <b><p><%= message1 %>  </p></b> </br>
        
        <div id="updatedelete" class="container">
            
         <form action="registerupdateaction.jsp" method="POST">
            <tr>
                <td> <label> email: </label> </td>
                <td><input type="text" name="email" value="<%=email%>" disabled > <br> <br> </td>
            </tr>
            
            <tr>
                <td> <label> firstname: </label> </td> 
                <td> <input type="text" name="firstname" value="<%=firstname%>" > <br> <br> </td>
            </tr>
            
            <tr>
                <td> <label> lastname: </label> </td> 
                <td> <input type="text" name="lastname" value="<%=lastname%>"> <br> <br> </td>
            </tr>
           
            
            <tr>
                <td> <label> password:</label> </td>
                <td> <input type="password" name="password" value="<%=password%>" > <br> <br>  </td> 
            
            </tr>
            
             <tr>
                <td> <label> phonenumber: </label> </td> 
                <td> <input type="text" name="phonenumber" value="<%=phone%>"><br> <br> </td>
            </tr>
          
        
            <input id="update" type="submit" name="submit" value="update" >  <input type="button" id="delete" value="Delete account"></a>
        </form>
            
     
        </div> 
    </body>
</html>

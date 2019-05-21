<%-- 
    Document   : register
    Created on : May 10, 2019, 10:53:42 PM
    Author     : mawgeeokura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    
    
    <body>
        <h1>Register</h1>
        <br> 
        <div class="container">
            <!-- When button clicked it runs script that retrieves values and adds to database.
            First check if account already exists. If it does not exist then add but if it already does then show warning-->
        
            
        <form action="index1.jsp" method="POST">
            <tr>
                <td> <label> email: </label> </td>
                <td><input type="text" name="email" required> <br> <br> </td>
            </tr>
            
            <tr>
                <td> <label> firstname: </label> </td> 
                <td> <input type="text" name="firstname" required> <br> <br> </td>
            </tr>
            
            <tr>
                <td> <label> lastname: </label> </td> 
                <td> <input type="text" name="lastname" required > <br> <br> </td>
            </tr>
           
            
            <tr>
                <td> <label> password:</label> </td>
                <td> <input type="password" name="password" required > <br> <br>  </td> 
            
            </tr>
            
             <tr>
                <td> <label> phonenumber: </label> </td> 
                <td> <input type="text" name="phonenumber" required > <br> <br> </td>
            </tr>
          
 
            <input type="submit" name="submit" id="register" onclick="location.href = 'registeradd.jsp'" > 
        </form>
        
            
            <p>
                
               
                
                
            </p>
        </div>
    </body>
</html>

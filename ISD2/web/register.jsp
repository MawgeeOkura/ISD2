<%-- 
    Document   : register
    Created on : May 10, 2019, 10:53:42 PM
    Author     : mawgeeokura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS.css" rel="stylesheet" type="text/css">
<%@page import="oms.Model.*" %>
 


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    
    
    <body>
         <ul >
  <li><a class="active" href="index.jsp">Home</a></li>

    <div class="dropdown">
        
        <button class="dropbtn"> Movies <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="movie/moviesearch.jsp">List or Search Movies</a>
        <a href="movie/viewmovie.jsp">View Saved Movies</a>
        <a href="movie/movieupdatedelete.jsp">Update/Delete Saved Movies</a>
 
    </div>
    </div> 
  
    <div class="dropdown">
        
        <button class="dropbtn"> Payment <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="payment/addpaymentdetails.jsp">Add Payment Details</a>
        <a href="payment/viewpayments.jsp">View Payment Details</a>
        <a href="payment/updatedeletepayments.jsp">Update/Delete Payment Details</a>
 
    </div>
    </div> 
  
  
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Shipment <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="shipment/createshipment.jsp">Add Shipment Details</a>
        <a href="shipment/viewshipment.jsp">View Shipment Details</a>
        <a href="shipment/updatedeleteshipment.jsp">Update/Delete Shipment Details</a>
 
    </div>
    </div> 
  
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Track Orders <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="order/addorder.jsp">Create Orders</a>
        <a href="order/vieworders.jsp">View Orders</a>
        <a href="order/updatecancelorder.jsp">Update/Cancel Orders</a>
      
 
    </div>
    </div> 
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Account Management <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="user/accesslogs.jsp">View Access Logs</a>
        <a href="user/registerviewaction.jsp">View Account Details</a>
        <a href="user/registercheckaction.jsp">Update/Delete Account Details</a>
 
    </div>
    </div> 
  
  
    <li><a href="#about">Help</a></li>
       <li id="register"> <a href="register.jap"> Register </a> </li>
    <li id="login"> <a href="login.jsp"> Login </a> <li>
</ul>
        
        <h1>Register</h1>
        <br> 
        <div class="container">
            <!-- When button clicked it runs script that retrieves values and adds to database.
            First check if account already exists. If it does not exist then add but if it already does then show warning-->
        
            
        <form action="registeradd.jsp" method="POST">
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
          
 
            <input type="submit" name="submit" id="register"  value="Register"> 
        </form>
        
            
            <p>
                
               
                
                
            </p>
        </div>
    </body>
</html>

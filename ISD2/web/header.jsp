<%-- 
    Document   : header
    Created on : 08/05/2019, 12:01:25 PM
    Author     : Mawgee.Okura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
           <ul>
  <li><a class="active" href="index.jsp">Home</a></li>

    <div class="dropdown">
        
        <button class="dropbtn"> Movies <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="../movie/moviesearch.jsp">List or Search Movies</a>
        <a href="../movie/viewmovie.jsp">View Saved Movies</a>
        <a href="../movie/movieupdatedelete.jsp">Update/Delete Saved Movies</a>
 
    </div>
    </div> 
  
    <div class="dropdown">
        
        <button class="dropbtn"> Payment <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="../payment/addpaymentdetails.jsp">Add Payment Details</a>
        <a href="../payment/viewpayments.jsp">View Payment Details</a>
        <a href="../payment/updatedeletepayments.jsp">Update/Delete Payment Details</a>
 
    </div>
    </div> 
  
  
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Shipment <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="../shipment/createshipment.jsp">Add Shipment Details</a>
        <a href="../shipment/viewshipment.jsp">View Shipment Details</a>
        <a href="../shipment/updatedeleteshipment.jsp">Update/Delete Shipment Details</a>
 
    </div>
    </div> 
  
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Track Orders <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="../order/addorder.jsp">Create Orders</a>
        <a href="../order/vieworders.jsp">View Orders</a>
        <a href="../order/updatecancelorder.jsp">Update/Cancel Orders</a>
      
 
    </div>
    </div> 
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Account Management <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="../user/accesslogs.jsp">View Access Logs</a>
        <a href="../user/registerviewupdatedelete.jsp">Update/Delete Account Details</a>
 
    </div>
    </div> 
  
  
    <li><a href="#about">Help</a></li>
    <li id="login"> <a href="login"> Login/Register </a> <li>
</ul>
    </body>
</html>

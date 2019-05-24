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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register View</title>
        
        <%!   
            String firstname;
            String lastname;
            String email;
            String phone;
            Boolean disabled;
            String notice;
            
            %>
         <%  
            DBManager manager = (DBManager)session.getAttribute("db");
             Register viewuser = (Register) session.getAttribute("loggedin");
           %>
           
    
              <%  String email = viewuser.getEmail();
               Customer customer = manager.findCustomer(email);     
            %> 
            
            
            <%
                if(viewuser.getEmail() != "error"){
                    notice   = ""; 
                    disabled = false;
                    firstname = customer.getFirstName();
                    lastname  = customer.getLastName();
                    email     = customer.getEmail();
                    phone     = customer.getPhone();
                } 
                else{
                    disabled = true;
                    notice = "Please login to view details"; 
                    firstname = "";
                    lastname = "";
                    email    = "";
                    phone    = "";
                    
                }
                
                
                %>
    </head>
    <body>
        
        <h2>View Account Details </h2>
        
        <b> <p><%= notice %> </p> </b> </br>
        <div class="container">
            
            <label> First Name: </label> <%= firstname %> </br>
            <label> Last Name: </label> <%= lastname %> </br>
            <label> Email: </label> <%= email %> </br>
            <label> Phone: </label> <%= phone %>  </br>
            
            
            </br>
         
        <!--    <input type="button" <c:if test="${!disabled}"><c:out value="disabled='disabled'"/></c:if>">
            
            <c:choose>
                    <c:when test="${!disabled}">
                            <button  value="SendEmail" disabled="disabled" > </button>
                    </c:when>
            <c:otherwise>
                    <input type="submit" value="SendEmail"  >
              </c:otherwise>
</c:choose> --> 
        </div> 
    </body>
</html>

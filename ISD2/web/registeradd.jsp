<%-- 
    Document   : registeradd
    Created on : 21/05/2019, 11:47:13 AM
    Author     : Mawgee.Okura
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Add Action</title>
    </head>
    <body>

        <!-- retrieve details from form submission --> 
        
        <%
            DateFormat currentdate = new SimpleDateFormat("yyyy-MM-dd"); //derby database has no datetime format
            Date date = new Date();
            DBManager manager = (DBManager)session.getAttribute("db");
            String firstname = request.getParameter("firstname");
            String  lastname = request.getParameter("lastname");
            String  email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phonenumber");
            String createdate = currentdate.format(date); 
            Boolean valid = false;
            
            //check data validation 
            
             if(!manager.isValidEmail(email)){
              session.setAttribute("invalidEmail","Invalid Email");
             }
            
             if(!manager.isValidName(firstname)){
              session.setAttribute("invalidFirstname","Invalid Firstname");   
             }
             
             if(!manager.isValidName(lastname)){
             
             session.setAttribute("invalidLastname","Invalid Lastname");
             
             }
             
             if(!manager.isValidNumber(phone)){
              session.setAttribute("invalidphone","Invalid Phone");    
             }
             
             //if all fields are valid then set valid to true 
             
             if(manager.isValidName(firstname) && manager.isValidName(lastname) && manager.isValidEmail(email)){
                 valid = true;
             }
           
            //when valid is true , check if customer already exists in database 
             
            if(valid){
                
            Customer customer = manager.findCustomer(email); //difference between customer and register is that anyone can be registered not everyone can be customer
           
            
            // if customer does not exist then add customer to database 
            if (customer == null) {
                
                manager.addCustomer(firstname,lastname ,password , email ,phone , createdate );
                response.sendRedirect("registerconfirmed.jsp"); 
                session.setAttribute("invalidLastname",null);
                session.setAttribute("invalidFirstname",null);
                session.setAttribute("invalidEmail",null);
                session.setAttribute("invalidphone",null);   
                
               
            }else{
             //if customer exists then redirect to login page and give warning. 
                 response.sendRedirect("login.jsp"); 
                 session.setAttribute("accountexists", customer);
                 session.setAttribute("invalidLastname",null);
                 session.setAttribute("invalidFirstname",null);
                 session.setAttribute("invalidEmail",null);
                 session.setAttribute("invalidphone",null);                          
            }       
                
            }else {
                
                response.sendRedirect("register.jsp");
                 
            }
                %>
        
       
       
        
     
        
    </body>
</html>

<%-- 
    Document   : registerview
    Created on : 14/05/2019, 9:55:54 AM
    Author     : Mawgee.Okura
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 
       <%!  
             String firstname;
             String lastname;
             String email;
             int phone;
             String password;
             
           %> 
        
        <%  
          
            Register updateuser = (Register) session.getAttribute("loggedin");
                 
            %> 
            
            
         <%
                if(updateuser.getEmail() != "error"){
                    
                    firstname = updateuser.getFirstname();
                    lastname  = updateuser.getLastname();
                    email     = updateuser.getEmail();
                    phone     = updateuser.getPhone();
                    password  = updateuser.getPassword();
                } 
                else{
                 
                    firstname = "Please login to update account details";
                    lastname = "";
                    email    = "";
                    phone    = 0;
                    password = "";
                    
                }
                
                
                %>
            
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Update </title>
   
      
    </head>
    <body>
        
        <h2>Update Account Details </h2>
        
        <div class="container">
            
         <form action="updateregister.jsp" method="POST">
            <tr>
                <td> <label> email: </label> </td>
                <td><input type="text" name="email" value="<%=email%>" > <br> <br> </td>
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
          
 
            <input type="submit" name="submit"> 
        </form>
     
        </div> 
    </body>
</html>

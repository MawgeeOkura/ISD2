/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.DAO;

import oms.Model.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author clint
 */
public class DBManager {
    
    private Statement st;
    private ResultSet resObj;
    private String query;
    private String query1;
    
    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public DBManager() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
 
    
     
   //find Customer in database based on email - Created by Mawgee Okura 
     public Customer findCustomer(String email) throws SQLException {
        
        query = "select * from customer where email='"+ email + "'";
        
        resObj = st.executeQuery(query);
        
        boolean hasCustomer = resObj.next();
        
        Customer CustomerDB = null;
        
        if(hasCustomer){
            
            String sID = resObj.getString("ID");
            String sFirstname = resObj.getString("firstName");
            String sLastname = resObj.getString("lastName");
            String sPassword = resObj.getString("password");
            String sEmail= resObj.getString("email");
            String sPhone = resObj.getString("phone");
            String sCreateDate = resObj.getString("createDate");
            String sRoleId = resObj.getString("roleId");
           
            
            CustomerDB = new Customer (Integer.parseInt(sID),sFirstname , sLastname, sPassword , sEmail, sPhone , sCreateDate ,Integer.parseInt(sRoleId));
            
             System.out.println("customerfound");
        }
        
        resObj.close();
        
        return CustomerDB;
        
    }  
    
    //add Customer to customer table in database - Created by Mawgee Okura  
    public void addCustomer(String firstname ,String lastname ,String password ,String email ,String phone,String createdate ) throws SQLException {
       
    query = "INSERT INTO Customer (FIRSTNAME,LASTNAME,PASSWORD,EMAIL,PHONE,CREATEDATE,ROLEID) values ('"+firstname+"','"+lastname+"','"+password+"','"+email+"','"+phone+"','"+createdate+"',7)";
                
    st.executeUpdate(query);
        
     
    }
    
    //update Customer details in customer table in database - Created by Mawgee Okura 
    
    public void updateCustomer(int ID,String firstname ,String lastname ,String password  ,String phone,String createdate ) throws SQLException {
       
    query = "UPDATE Customer SET FIRSTNAME = '"+firstname +"'  , LASTNAME ='"+lastname+"' , PASSWORD = '"+password+"'  , PHONE = '"+phone+"' , CREATEDATE='"+createdate+"'  where ID="+ID+"";
   
    st.executeUpdate(query);
        
     
    }
    
    //delete Customer details in customer table in database - Created by Mawgee Okura 
    
    public void deleteCustomer(int ID) throws SQLException{
        
    query1 = "DELETE FROM USER WHERE USER.CUSTOMERID="+ID+"";
    query = "DELETE FROM CUSTOMER WHERE ID ="+ID+"";
    st.executeUpdate(query1);
    st.executeUpdate(query);
        
        
    }
    
    //find Staff in Staff table based on email - Created by Mawgee Okura 
    
     public Staff findStaff(String email) throws SQLException {
        
        query = "select * from Staff where email='"+ email + "'";
        
        resObj = st.executeQuery(query);
        
        boolean hasStaff = resObj.next();
        
        Staff staffDB = null;
        
        if(hasStaff){
            
            String sID = resObj.getString("ID");
            String sFirstname = resObj.getString("firstName");
            String sLastname = resObj.getString("lastName");
            String sPassword = resObj.getString("password");
            String sEmail= resObj.getString("email");
            String sPhone = resObj.getString("phone");
            String sCreateDate = resObj.getString("createDate");
            String sRoleId = resObj.getString("roleId");
           
            
            staffDB= new Staff (Integer.parseInt(sID),sFirstname , sLastname, sPassword , sEmail, sPhone , sCreateDate ,Integer.parseInt(sRoleId));
            
             System.out.println("staff found");
        }
        
        resObj.close();
        
        return staffDB;
        
    } 
    
    //checks if Email is in valid format -- created by Mawgee Okura  
     
    public boolean isValidEmail(String email){
         String emailRegex = "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$";
        return email.matches(emailRegex);
    }
    
     //checks there are no numbers in a string -- created by Mawgee Okura  
    public boolean isValidName(String name){
        String nameRegex ="[a-zA-Z]+";
        
        return name.matches(nameRegex);
    
    }
    
    //checks if there are no characters in a number -- created by Mawgee Okura 
    
    public boolean isValidNumber(String number){
        String numberRegex = "^[0-9]*$";
        
        return number.matches(numberRegex);
    }
    
    
    //checks if a user is a staff or a customer 
    public boolean validateRole(int number , String email) throws SQLException{
        Customer customer = findCustomer(email);
        Staff staff = findStaff(email);
        Boolean isvalid = false;
        int ID = (customer.getRoleId());
        
        if(customer != null){
            query = "select permission from ROLE where permission='Customer' AND ID='"+ ID + "'"; 
           
            ResultSet isCustomer = st.executeQuery(query);
            
            if(isCustomer !=null){
                isvalid = true;
            }
        } else {
            if(staff != null){
            
            query = "select permission from ROLE where permission='Staff' AND ID='"+ ID + "'"; 
           
            ResultSet isStaff = st.executeQuery(query);
                if(isStaff != null){
                    isvalid = true;
                }
                
            }
            
        }
       
        return isvalid;
    }
    
  
   
  
}

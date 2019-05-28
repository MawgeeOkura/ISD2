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
    
    public void addCustomer(String firstname ,String lastname ,String password ,String email ,String phone,String createdate ) throws SQLException {
       
    query = "INSERT INTO Customer (FIRSTNAME,LASTNAME,PASSWORD,EMAIL,PHONE,CREATEDATE,ROLEID) values ('"+firstname+"','"+lastname+"','"+password+"','"+email+"','"+phone+"','"+createdate+"',7)";
                
    st.executeUpdate(query);
        
     
    }
    
    
    public void updateCustomer(int ID,String firstname ,String lastname ,String password  ,String phone,String createdate ) throws SQLException {
       
    query = "UPDATE Customer SET FIRSTNAME = '"+firstname +"'  , LASTNAME ='"+lastname+"' , PASSWORD = '"+password+"'  , PHONE = '"+phone+"' , CREATEDATE='"+createdate+"'  where ID="+ID+"";
   
    st.executeUpdate(query);
        
     
    }
    
    public void deleteCustomer(int ID) throws SQLException{
    
    query = "DELETE FROM CUSTOMER WHERE ID ="+ID+"";
    st.executeUpdate(query);
        
        
    }
    
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
    
    public boolean isValidEmail(String email){
         String emailRegex = "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$";
        return email.matches(emailRegex);
    }
      
    public boolean isValidName(String name){
        String nameRegex ="[a-zA-Z]+";
        
        return name.matches(nameRegex);
    
    }
    
    public boolean isValidNumber(String number){
        String numberRegex = "^[0-9]*$";
        
        return number.matches(numberRegex);
    }
    
    
    
    public boolean validateRole(int number , String email) throws SQLException{
        Customer customer = findCustomer(email);
        Staff staff = findStaff(email);
        Boolean isvalid = false;
        
        if(customer != null){
            if(customer.getRoleId() == number){
                isvalid = true;
            }
        } else {
            if(staff != null){
                if(staff.getRoleId() == number){
                    isvalid = true;
                }
                
            }
            
        }
       
        return isvalid;
    }
    
  
    

  
    
  
}

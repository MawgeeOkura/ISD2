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
            String sPaymentdetailsid = resObj.getString("paymentdetailsid");
            
            CustomerDB = new Customer (Integer.parseInt(sID),sFirstname , sLastname, sPassword , sEmail, sPhone , sCreateDate , Integer.parseInt(sPaymentdetailsid));
            
             System.out.println("customerfound");
        }
        
        resObj.close();
        
        return CustomerDB;
        
    }  
    
    public void addCustomer(String firstname ,String lastname ,String password ,String email ,String phone,String createdate ,String paymentdetailsid) throws SQLException {
       
    query = "INSERT INTO Customer (FIRSTNAME,LASTNAME,PASSWORD,EMAIL,PHONE,CREATEDATE,PAYMENTDETAILSID) values ('"+firstname+"','"+lastname+"','"+password+"','"+email+"','"+phone+"','"+createdate+"',"+paymentdetailsid+")";
                
    st.executeUpdate(query);
        
     
    }
    
    
    public void updateCustomer(int ID,String firstname ,String lastname ,String password  ,String phone,String createdate ,String paymentdetailsid) throws SQLException {
       
    query = "UPDATE Customer SET FIRSTNAME = '"+firstname +"'  , LASTNAME ='"+lastname+"' , PASSWORD = '"+password+"'  , PHONE = '"+phone+"' , CREATEDATE='"+createdate+"' , PAYMENTDETAILSID= "+paymentdetailsid+" where ID="+ID+"";
   
    st.executeUpdate(query);
        
     
    }
    
    public void deleteCustomer(int ID) throws SQLException{
    
    query = "DELETE FROM CUSTOMER WHERE ID ="+ID+"";
    st.executeUpdate(query);
        
        
    }
      
    
  
    
  
}

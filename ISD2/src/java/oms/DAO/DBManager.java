/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.DAO;


import java.math.BigDecimal;
import java.math.RoundingMode;
import oms.Model.Movie;
import oms.Model.Staff;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import oms.Model.Customer;
import oms.Model.Order;
import oms.Model.OrderDetails;
import oms.Model.Payment;
import oms.Model.User;

/**
 *
 * @author clint
 */
public class DBManager {
    
    private Statement st;
    private ResultSet resObj;
    private String query;
    private String query1;
    private String query2;
    private final String CUSTOMER = "CUSTOMER";
    private final String FULL_ACCESS = "FULL_ACCESS";
    private final String STAFF = "STAFF";
    private final String ADMINISTRATOR = "ADMINISTRATOR";
    private final String ACTIVE = "ACTIVE";
    
    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public DBManager() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
 
    private ArrayList<Movie> setMovies(ResultSet resObj) throws SQLException {
//        System.out.println("setMovies()");
        ArrayList<Movie> movies = new ArrayList<>();
        while (resObj.next()) {
            Movie movie = new Movie();
            movie.setId(resObj.getLong("id"));
            movie.setName(resObj.getString("name"));
            movie.setDescription(resObj.getString("description"));
            movie.setGenre(resObj.getString("genre"));
            movie.setReleaseDate(resObj.getString("releaseDate"));
            movie.setRuntime(resObj.getInt("runtime"));
            movie.setKeywords(resObj.getString("keywords"));
            movie.setRating(resObj.getFloat("rating"));
            movie.setPrice(resObj.getDouble("price"));
            movie.setStatus(resObj.getString("status"));
            movie.setNumberOfCopies(resObj.getInt("numberOfCopies"));
            movies.add(movie);
        }
        return movies;
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
            String sPaymentdetailsid = resObj.getString("paymentdetailsid");
            if(sPaymentdetailsid == null ){
            sPaymentdetailsid = "0";
            }
            CustomerDB = new Customer (Integer.parseInt(sID),sFirstname , sLastname, sPassword , sEmail, sPhone , sCreateDate ,Integer.parseInt(sRoleId) ,Integer.parseInt(sPaymentdetailsid));
            
             System.out.println("customerfound");
        }
        
        resObj.close();
        
        return CustomerDB;
        
    }  
     
       public Customer findCustomerbasedonID(int id) throws SQLException {
        
        query = "select * from customer where ID='"+ id + "'";
        
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
            String sPaymentdetailsid = resObj.getString("paymentdetailsid");
            if(sPaymentdetailsid == null){
                sPaymentdetailsid = Integer.toString(retrievemostrecentpayment());
            }
            CustomerDB = new Customer (Integer.parseInt(sID),sFirstname , sLastname, sPassword , sEmail, sPhone , sCreateDate ,Integer.parseInt(sRoleId) ,Integer.parseInt(sPaymentdetailsid));
            
             System.out.println("customerfound");
        }
        
        resObj.close();
        
        return CustomerDB;
        
    }  
    
    //add Customer to customer table in database - Created by Mawgee Okura  
    public void addCustomer(String firstname ,String lastname ,String password ,String email ,String phone,String createdate) throws SQLException {
    
    createPaymentId();   
    int paymentdetailsid = retrievemostrecentpayment();
    query = "INSERT INTO Customer (FIRSTNAME,LASTNAME,PASSWORD,EMAIL,PHONE,CREATEDATE,PAYMENTDETAILSID,ROLEID) values ('"+firstname+"','"+lastname+"','"+password+"','"+email+"','"+phone+"','"+createdate+"',"+paymentdetailsid+",7)";
                
    st.executeUpdate(query);
        
     
    }
    
    //update Customer details in customer table in database - Created by Mawgee Okura 
    
    public void updateCustomer(int ID,String firstname ,String lastname ,String password  ,String phone,String createdate ) throws SQLException {
       
    query = "UPDATE Customer SET FIRSTNAME = '"+firstname +"'  , LASTNAME ='"+lastname+"' , PASSWORD = '"+password+"'  , PHONE = '"+phone+"' , CREATEDATE='"+createdate+"'  where ID="+ID+"";
   
    st.executeUpdate(query);
        
     
    }
    
    //delete Customer details in customer table in database - Created by Mawgee Okura 
    
    public void deleteCustomer(int ID, int payID) throws SQLException{
        
    /*query1 = "DELETE FROM 'USER' U WHERE U.CUSTOMERID="+ID+"";
    query2 = "DELETE FROM PAYMENTDETAILS P WHERE P.ID="+payID+"";
    query = "DELETE FROM CUSTOMER WHERE ID ="+ID+"";
    st.executeUpdate(query1);
    st.executeUpdate(query);
        */
        
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
    
    
    //checks if a user is a staff or a customer  can implement after merge.
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
    //create paymentId for user -- Created by Mawgee Okura 
        public void createPaymentId() throws SQLException{
        
         addPayment( "", 0, "", 0, "", "", 0);
       
        }
     //retrieve the most recent payment record -- Created by Mawgee Okura    
        public int retrievemostrecentpayment() throws SQLException{
        
         int sID = 0;   
          query = "select max(id) as ID from paymentdetails";
          
          resObj = st.executeQuery(query);
          
          if(resObj.next()){
              sID = Integer.parseInt(resObj.getString("ID"));
          } 
          return sID;
        }
      //retrieve the most recent payment record -- Created by Mawgee Okura    
         public int retrievemostrecentcustomer() throws SQLException{
        
         int sID = 0;   
          query = "select max(id) as ID from CUSTOMER";
          
          resObj = st.executeQuery(query);
          
          if(resObj.next()){
              sID = Integer.parseInt(resObj.getString("ID"));
          } 
          return sID;
        }
        
       /* public void updateCustomerpaymentId(int customerid,int payid) throws SQLException{
            query = "UPDATE CUSTOMER SET PAYMENTDETAILSID="+payid+" WHERE ID="+customerid+"";
            
        } */

    
        public Payment findPayment(int id) throws SQLException {
        
        query = "select * from paymentdetails where id="+ id + "";
        
        resObj = st.executeQuery(query);
        
        boolean hasPayment = resObj.next();
        
        Payment PaymentDB = null;
        
        if(hasPayment){
            
            String ID = resObj.getString("ID");
            String cardNumber = resObj.getString("CARDNUMBER");
            String cvc = resObj.getString("CVC");
            String expiryMonth = resObj.getString("EXPIRYMONTH");
            String expiryYear = resObj.getString("EXPIRYYEAR");
            String address = resObj.getString("ADDRESS1");
            String state = resObj.getString("STATE");
            String postCode = resObj.getString("POSTCODE");
            
            PaymentDB = new Payment (Integer.parseInt(ID),cardNumber,Integer.parseInt(cvc),expiryMonth,Integer.parseInt(expiryYear),address,state,Integer.parseInt(postCode));
             
        }
        
        resObj.close();
        
        return PaymentDB;
        
    }  
    
    public void updatePayment(int ID,String cardNumber ,int cvc ,String expiryMonth ,int expiryYear ,String address,String state ,int postCode) throws SQLException {
       
    query = "UPDATE paymentdetails SET CARDNUMBER = '"+cardNumber +"'  , CVC ="+cvc+" , EXPIRYMONTH = '"+expiryMonth+"' , EXPIRYYEAR = "+expiryYear+" , ADDRESS1 = '"+address+"' , STATE='"+state+"' , POSTCODE= "+postCode+" where ID="+ID+"";
   
    st.executeUpdate(query);
        
    }
    
    public void addPayment(String cardNumber ,int cvc ,String expiryMonth ,int expiryYear ,String address,String state ,int postCode) throws SQLException {
       
    query = "INSERT INTO paymentdetails (CARDNUMBER,CVC,EXPIRYMONTH,EXPIRYYEAR,ADDRESS1,ADDRESS2,STATE,POSTCODE) values ('"+cardNumber+"',"+cvc+",'"+expiryMonth+"',"+expiryYear+",'"+address+"','"+"','"+state+"',"+postCode+")";
                
    st.execute(query);
   
    }
    
    
  
   
  
}

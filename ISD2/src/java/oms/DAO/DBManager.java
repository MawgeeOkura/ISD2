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
    
    public ArrayList<Staff> getAllStaff() throws SQLException {
        query = "Select * FROM Staff";
        resObj = st.executeQuery(query);
        return setStaffs(resObj);
    }
    
    public Movie getMovieById(long id) throws SQLException {
        query = "SELECT * FROM Movie WHERE id = "+id+" LIMIT 1";
        resObj = st.executeQuery(query);
        return setMovies(resObj).get(0);
    }
    
    public ArrayList<Movie> getAllMovies() throws SQLException {
        query = "SELECT * FROM Movie";
        resObj = st.executeQuery(query);
        return setMovies(resObj);
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
            
            
        }
        
        resObj.close();
        
        return CustomerDB;
        
    }  
    
    public void addCustomer(String firstname ,String lastname ,String password ,String email ,String phone,String createdate ,String paymentdetailsid) throws SQLException {
       
    query = "INSERT INTO Customer (FIRSTNAME,LASTNAME,PASSWORD,EMAIL,PHONE,CREATEDATE,PAYMENTDETAILSID) values ('"+firstname+"','"+lastname+"','"+password+"','"+email+"','"+phone+"','"+createdate+"',"+paymentdetailsid+")";
                
    st.executeUpdate(query);
        
     
    }
    
    
    public void updateCustomer(int ID,String firstname ,String lastname ,String password ,String email ,String phone,String createdate ,String paymentdetailsid) throws SQLException {
       
    query = "UPDATE Customer SET FIRSTNAME = '"+firstname +"'  , LASTNAME ='"+lastname+"' , PASSWORD = '"+password+"' , EMAIL = '"+email+"' , PHONE = '"+phone+"' , CREATEDATE='"+createdate+"' , PAYMENTDETAILSID= "+paymentdetailsid+" where ID="+ID+"";
   
    st.executeUpdate(query);
        
     
    }
    
    public void deleteCustomer(int ID) throws SQLException{
    
    query = "DELETE FROM CUSTOMER WHERE ID ="+ID+"";
    st.executeUpdate(query);
        
        
    }
    
    private ArrayList<Staff> setStaffs(ResultSet resObj) throws SQLException {
         ArrayList<Staff> staffs = new ArrayList<>();
         while (resObj.next()) {
                Staff staff = new Staff();
                staff.setId(resObj.getLong("id"));
                staff.setFirstName(resObj.getString("firstName")); 
                staff.setLastName(resObj.getString("lastName"));
                staff.setPassword(resObj.getString("password"));
                staff.setEmail(resObj.getString("email"));
                staff.setPhone(resObj.getString("phone"));
                staff.setCreateDate(resObj.getString("createDate"));
                staff.setRoleId(resObj.getInt("roleId"));
                staffs.add(staff);
//                System.out.println("Found: "+staff.toString());
        }
        return staffs;
    }
    
    private ArrayList<Movie> setMovies(ResultSet resObj) throws SQLException {
        System.out.println("setMovies()");
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
            movies.add(movie);
        }
        return movies;
    }
}

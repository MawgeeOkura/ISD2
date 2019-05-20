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
    
    public Customer findcustomer(String email) throws SQLException{
        
        String searchCustomer = "select * from customer where email='"+ email + "'";
        
        Customer customerDB = null;
        
        ResultSet rs = st.executeQuery(searchCustomer);
        
        boolean hasCustomer = rs.next();
        
        if(hasCustomer){
            
            String sID = rs.getString("ID");
            String sFirstname = rs.getString("firstname");
            String sLastname = rs.getString("lastname");
            String sPassword = rs.getString("password");
            String sEmail = rs.getString("email");
            String sPhone = rs.getString("phone");
            String sCreatedate = rs.getString("createdate");
            String sPaymentdetails = rs.getString("paymentdetails");
            
            customerDB = new Customer (Integer.parseInt(sID) , sFirstname , sLastname , sPassword , sEmail , sPhone , sCreatedate, Integer.parseInt(sPaymentdetails));
            
        }
        
        rs.close();
        
        return customerDB;
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

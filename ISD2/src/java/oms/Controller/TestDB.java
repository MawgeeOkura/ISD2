/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import oms.DAO.DBConnector;
import oms.DAO.DBManager;
import oms.Model.*;
/**
 *
 * @author clint
 */
public class TestDB {
    
    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
           
            String email= "33";
             Customer allCustomer = db.findCustomer(email);
             System.out.println("found Customer" + allCustomer.toString());
             
          
            
            String date ="2019-05-21";
            String memes ="hi";
            String number = "1";
            db.addCustomer(email, email, email, email, email, date);
            db.findCustomer(email);
           //find customer and delete based on ID 
            
           int ID=4;
           db.updateCustomer(ID, memes, memes,  memes, date, date);
                
                    
        } catch (ClassNotFoundException cx) {
            System.out.println("Class Not Found Exception");
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, cx);
        } catch (SQLException sx) {
            System.out.println("SQL Exception");
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, sx);
        } 
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Controller;

import oms.Model.*;
import oms.DAO.DBManager;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Max.Okura
 */
public class Controller {

    public Controller() {
        this.manager = new DBManager();
       
    }
    
    DBManager manager;
    
    
    public void registerCustomer(String firstname, String lastname , String password , String email , String phone , String createdate , String paymentdetailsid) throws SQLException{
        
        manager.addCustomer(firstname, lastname, password, email, phone, createdate);
    
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.DAO;

import java.sql.Connection;

/**
 *
 * @author clint
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/omsdatabase";
    protected String db =  "OMOA_DB";
    protected String dbUser = "Mawgee";
    protected String dbPass = "Okura";
    protected String driver = "org.apache.derby.jdbc.ClientDriver"; //I'm not sure what this is for mysql
//    protected String driver = "org.apache.mysql.ClientDriver"; //I'm not sure what this is for mysql
    protected Connection conn;
}
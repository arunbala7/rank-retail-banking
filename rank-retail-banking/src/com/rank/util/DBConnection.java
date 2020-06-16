package com.rank.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Database Util
 * @author Arun Bala
 */
public class DBConnection {
    private static Connection con;
    private static final String Driver = "com.mysql.jdbc.Driver";
    private static final String ConnectionString = "jdbc:mysql://localhost:3306/rank?useSSL=false";
    private static final String user = "root";
    private static final String pwd = "root";

    public static Connection getConnection() throws Exception {        
        Class.forName(Driver);       
        con = DriverManager.getConnection(ConnectionString, user, pwd);
        return con;
    }
    public static void closeConnection() throws Exception {    
    	con.close();    	
    }
}
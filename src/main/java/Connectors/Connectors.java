package Connectors;


import java.sql.*;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author manny
 */



public class Connectors {
    protected String Controlador = "com.mysql.cj.jdbc.Driver";
    protected String url = "jdbc:mysql://localhost/Tienda";
    protected String user = "profesor";
    protected String password="Pepino76$";
    
    public Connection conn() throws ClassNotFoundException{
        Connection dbConn = null;
        try{
            Class.forName(Controlador);
            dbConn = DriverManager.getConnection(url,user,password);
        }catch(SQLException ex){
            ex.getMessage();
        }
        
        return dbConn;
    }
}

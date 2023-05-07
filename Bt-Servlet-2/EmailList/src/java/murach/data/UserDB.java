/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package murach.data;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import murach.business.User;
import java.io.FileWriter;
import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class UserDB {

    private static String DB_URL = "jdbc:mysql://localhost:3306/user";
    private static String user_name = "root";
    private static String password = "anh1710gdt";
  

    public static void insert(User user,String path) {
        try {
            
            FileWriter fw = new FileWriter(path,true);
//            fw.write(user.getEmail()+"\\"+user.getFirstName()
//                    +"\\"+user.getLastName()+"\\"+user.getMusic()+"\n");
            fw.write(user.getEmail()+"\n");
            fw.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        System.out.println("Success...");
        // TODO code application logic here
//        try {
//            // connnect to database 'testdb'
//            Connection conn = getConnection(DB_URL, user_name, password);
//            // crate statement
//            Statement stmt = conn.createStatement();
//            // insert data
//            String insertSQL = "INSERT INTO ql_email (email, phone, firstName, lastName, gender, education) "
//                    + "VALUES ('" + user.getEmail() + "', '" + user.getPhoneNumber() + "', '"
//                    + user.getFirstName() + "', '" + user.getLastName() + "', '" + user.getGender() + "', '" + user.getMusic() + "')";
//            stmt.executeUpdate(insertSQL);
//            // show data
//            ShowData(stmt);
//            // close connection
//            conn.close();
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
    }

    public static Connection getConnection(String dbURL, String userName,
            String password) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, userName, password);
            System.out.println("Connected to the database successfully!");
        } catch (Exception ex) {
            System.out.println("Failed to connect to the database!");
            ex.printStackTrace();
        }
        return conn;
    }

    public static void ShowData(Statement stmt) throws SQLException {
        // get data from table 'user'
        ResultSet rs = stmt.executeQuery("select * from user.ql_email");
        
        // show data
        while (rs.next()) {
            System.out.println(rs.getString("email") + "  "
                    + rs.getString("phone") + "  "
                    + rs.getString("firstName") + "  "
                    + rs.getString("lastName")
                    + "  " + rs.getString("gender"));
            
        }
        
    }

}

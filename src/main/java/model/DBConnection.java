package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure you are using correct MySQL driver
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "Gurpreet@2004");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}

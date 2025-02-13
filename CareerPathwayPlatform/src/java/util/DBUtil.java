package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String MYSQL_URL = "jdbc:mysql://localhost:3306/carrentaldb";
    private static final String MYSQL_USER = "root";  // Change if needed
    private static final String MYSQL_PASSWORD = "root";  // Change if needed

    private static final String DERBY_URL = "jdbc:derby://localhost:1527/UserDB";
    private static final String DERBY_USER = "app";
    private static final String DERBY_PASSWORD = "app";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver
            Class.forName("org.apache.derby.jdbc.ClientDriver"); // Load Derby Driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Database drivers not found.");
        }
    }

    public static Connection getConnection(String dbType) throws SQLException {
        if ("MYSQL".equalsIgnoreCase(dbType)) {
            return DriverManager.getConnection(MYSQL_URL, MYSQL_USER, MYSQL_PASSWORD);
        } else if ("DERBY".equalsIgnoreCase(dbType)) {
            return DriverManager.getConnection(DERBY_URL, DERBY_USER, DERBY_PASSWORD);
        } else {
            throw new IllegalArgumentException("Invalid database type. Use 'MYSQL' or 'DERBY'.");
        }
    }
}


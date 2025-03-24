
package smart.desk;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author y4nn_777
 */
public class DatabaseConnection{
    private static final String URL = "jdbc:mysql://localhost:3306/helpdesk";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Method to get the database connection
    public static Connection getConnection() throws SQLException{
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connection successful!");

            // Connection is not closed here
            // Get the tables list
            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet tables = metaData.getTables(null, null, "%", new String[]{"TABLE"});

            System.out.println("Database tables :");
            while (tables.next()) {
                System.out.println("- " + tables.getString("TABLE_NAME"));
            }
            tables.close(); // Just close the tables ResultSet

        } catch (ClassNotFoundException e) {
            System.out.println("Error : JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error : Impossible to connect to the db !");
            e.printStackTrace();
        }
        return conn; // Return the Connection
    }
    
    
    public boolean isUser( String email, String password){
    String query = "SELECT * FROM users";
    boolean b = false;
    try (Connection connection = DatabaseConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query)) {
        System.out.println("Database data");
        while (resultSet.next()) {
            System.out.println("Email: " + resultSet.getString("email"));
            System.out.println("Password: " + resultSet.getString("password"));
            System.out.println("--------");
            String hashedPasswordFromDatabase = resultSet.getString("password");
            if (hashedPasswordFromDatabase.startsWith("$2y$")) {
                hashedPasswordFromDatabase = "$2a$" + hashedPasswordFromDatabase.substring(4);
            }
            boolean passwordIsValid = BCrypt.checkpw(password, hashedPasswordFromDatabase);
                if (resultSet.getString("email").equals(email) && passwordIsValid) {
                b = true;  // Change this to true to indicate a match
                return b;
            }
        }
    } catch (SQLException e) {
        System.out.println("Unexpected Error\nError Details: "+e);
    }
    return b; 
}


    
    
    public static void main(String args[]){
        try {
            getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

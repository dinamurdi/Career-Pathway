import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get user inputs from the form
        String name = request.getParameter("name");  // Case-sensitive, must match form field "Name"
        String email = request.getParameter("email");  // Must match form field "Email"
        String message = request.getParameter("message");  // Must match form field "Message"

        // Database connection details
        String url = "jdbc:derby://localhost:1527/Career"; // Adjust if needed
        String user = "app"; // Derby default username
        String password = "app"; // Derby default password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load Derby JDBC Driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Establish connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare SQL statement to insert form data
            String sql = "INSERT INTO CONTACT_MESSAGES (NAME, EMAIL, MESSAGE) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);

            // Execute the insert operation
            int rowsInserted = pstmt.executeUpdate();

            // Set response type and generate confirmation message
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<html><head><title>Contact Submitted</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f8f9fa; text-align: center; }");
            out.println(".container { width: 50%; margin: auto; background: white; padding: 20px;");
            out.println("border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); margin-top: 50px; }");
            out.println("a { text-decoration: none; color: #007bff; font-size: 18px; }");
            out.println("a:hover { color: #0056b3; }");
            out.println("</style></head><body>");
            out.println("<div class='container'>");

            if (rowsInserted > 0) {
                out.println("<h2>Thank You, " + name + "!</h2>");
                out.println("<p>Your message has been received. We will contact you at <b>" + email + "</b> soon.</p>");
            } else {
                out.println("<h2>Error!</h2>");
                out.println("<p>Something went wrong. Please try again.</p>");
            }

            out.println("<a href='home.jsp'>Go Back</a>");
            out.println("</div>");
            out.println("</body></html>");
            
} catch (ClassNotFoundException e) {
    e.printStackTrace();  // Prints to server logs
    response.getWriter().println("Database driver not found: " + e.getMessage());
} catch (SQLException e) {
    e.printStackTrace();  // Prints to server logs
    response.getWriter().println("SQL Exception: " + e.getMessage());
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().println("Unexpected error: " + e.getMessage());
}

    }
}

package JobListing;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubmitJobServlet")
public class SubmitJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Read form data
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String type = request.getParameter("type");
        String location = request.getParameter("location");
        String responsibilities = request.getParameter("responsibilities");
        String requirements = request.getParameter("requirements");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/carrentaldb";
        String dbUser = "root";
        String dbPassword = "";

        String message = "";
        String messageType = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "INSERT INTO job_listings (title, company, type, location, responsibilities, requirements) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, company);
            statement.setString(3, type);
            statement.setString(4, location);
            statement.setString(5, responsibilities);
            statement.setString(6, requirements);

            int rowsInserted = statement.executeUpdate();
            statement.close();
            connection.close();

            if (rowsInserted > 0) {
                message = "Job submitted successfully!";
                messageType = "success";
            } else {
                message = "Failed to submit job. Please try again.";
                messageType = "error";
            }

        } catch (Exception e) {
            e.printStackTrace();
            message = "An error occurred while submitting the job.";
            messageType = "error";
        }

        // Redirect with message parameters
        response.sendRedirect("submitjob.jsp?message=" + message + "&type=" + messageType);
    }
}

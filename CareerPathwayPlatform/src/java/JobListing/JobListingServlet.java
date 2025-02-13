package JobListing;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/JobListingServlet")
public class JobListingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Job> jobList = new ArrayList<>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrentaldb", "root", "root");
            String sql = "SELECT title, company, location FROM job_listings";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                jobList.add(new Job(
    rs.getInt("id"), 
    rs.getString("title"), 
    rs.getString("company"), 
    rs.getString("type"), 
    rs.getString("location"), 
    rs.getString("responsibilities"), 
    rs.getString("requirements")
));
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("jobList", jobList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("joblistings.jsp");
        dispatcher.forward(request, response);
    }
}
package servlets;

import util.DBUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get form input
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        
        try (Connection conn = DBUtil.getConnection("MYSQL")) {  // Use MySQL
            String sql = "SELECT * FROM custdetails WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Check if the stored password matches input password
                if (rs.getString("cpword").equals(password)) {  // FIXED: "password" → "cpword"
                    
                    // Create session
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username); // Store in session

                    response.sendRedirect("welcome.jsp"); // Redirect on success
                } else {
                    request.setAttribute("error", "Invalid password. Please try again.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Username not found.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}


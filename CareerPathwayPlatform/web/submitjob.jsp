<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String company = request.getParameter("company");
    String type = request.getParameter("type");
    String location = request.getParameter("location");
    String responsibilities = request.getParameter("responsibilities");
    String requirements = request.getParameter("requirements");

    String jdbcURL = "jdbc:mysql://localhost:3306/job_portal";
    String dbUser = "root";
    String dbPassword = "";
    String message = "";
    String messageType = "";

    if (title != null && company != null) {
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
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Submit a Job Listing</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script>
        function showMessage() {
            var message = "<%= message %>";
            var messageType = "<%= messageType %>";
            if (message) {
                alert(message);
            }
        }
        window.onload = showMessage;
    </script>
    <style>
        body {font-family: "Times New Roman", Georgia, Serif;}
        h1, h2, h3, h4, h5, h6 {
            font-family: "Playfair Display";
            letter-spacing: 5px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <a href="home.jsp" class="w3-bar-item w3-button">Career Platform</a>
        <div class="w3-right w3-hide-small">
            <a href="joblisting.jsp" class="w3-bar-item w3-button">Jobs</a>
            <a href="submitjob.jsp" class="w3-bar-item w3-button">Submit Job</a>
        </div>
    </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="submit-job">
    <img class="w3-image" src="path_to_your_image.jpg" alt="Submit Job" width="1600" height="800">
    <div class="w3-display-bottomleft w3-padding-large w3-opacity">
        <h1 class="w3-xxlarge">Submit a Job Listing</h1>
    </div>
</header>

<!-- Submit Job Form -->
<div class="w3-content w3-padding-64" style="max-width:800px">
    <h2>Submit a Job Listing</h2>
    <form action="submitjob.jsp" method="POST" id="jobForm">
        <p><input class="w3-input w3-padding-16" type="text" placeholder="Job Title" required name="title"></p>
        <p><input class="w3-input w3-padding-16" type="text" placeholder="Company" required name="company"></p>
        <p><input class="w3-input w3-padding-16" type="text" placeholder="Job Type" required name="type"></p>
        <p><input class="w3-input w3-padding-16" type="text" placeholder="Location" required name="location"></p>
        <p><textarea class="w3-input w3-padding-16" placeholder="Responsibilities" required name="responsibilities"></textarea></p>
        <p><textarea class="w3-input w3-padding-16" placeholder="Requirements" required name="requirements"></textarea></p>
        <p><button class="w3-button w3-light-grey w3-section" type="submit">SUBMIT JOB</button></p>
    </form>
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
  <p><a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green"></a></p>
</footer>

</body>
</html>

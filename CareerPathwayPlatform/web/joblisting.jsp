<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Job Listings</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {font-family: "Times New Roman", Georgia, Serif;}
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
  letter-spacing: 5px;
}
.section {
  margin-bottom: 150px;
}
.section-content {
  padding-top: 50px;
  padding-bottom: 50px;
}
.job-details {
  display: none;
}
</style>
<script>
function toggleJobDetails(id) {
  var details = document.getElementById(id);
  if (details.style.display === "none" || details.style.display === "") {
    details.style.display = "block";
  } else {
    details.style.display = "none";
  }
}
</script>
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
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
  <img class="w3-image" src="path_to_your_image.jpg" alt="Job Listings" width="1600" height="800">
  <div class="w3-display-bottomleft w3-padding-large w3-opacity">
    <h1 class="w3-xxlarge">Job Listings</h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">
  <!-- Job Listings Section -->
  <div class="w3-row w3-padding-64 section" id="jobs">
    <div class="w3-col l12 w3-padding-large">
      <h1 class="w3-center">Available Jobs</h1><br>
      <div id="job-listings">
        <%-- Job listings dynamically inserted from database --%>
        <%
            String jdbcURL = "jdbc:mysql://localhost:3306/job_portal";
            String dbUser = "root";
            String dbPassword = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM job_listings");

                while (resultSet.next()) {
                    String jobId = "job" + resultSet.getInt("id");
        %>
        <div class="w3-card-4 w3-margin w3-white job-listing" onclick="toggleJobDetails('<%= jobId %>')">
            <div class="w3-container">
                <h2><%= resultSet.getString("title") %></h2>
                <p>Company: <%= resultSet.getString("company") %></p>
                <div id="<%= jobId %>" class="job-details">
                    <p>Type: <%= resultSet.getString("type") %></p>
                    <p>Location: <%= resultSet.getString("location") %></p>
                    <p>Responsibilities: <%= resultSet.getString("responsibilities") %></p>
                    <p>Requirements: <%= resultSet.getString("requirements") %></p>
                </div>
            </div>
        </div>
        <%
                }
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
  <p><a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green"></a></p>
</footer>

</body>
</html>

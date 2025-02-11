<!DOCTYPE html>
<html>
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link rel="stylesheet" href="mystyle.css">  <!-- This should be last -->

<head>
    <title>Login</title>
</head>
<body>
    
      <!-- Navbar -->
  <div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
      <a href="home.html" class="w3-bar-item w3-button">Career Platform</a>
      <div class="w3-right w3-hide-small">
        <a href="aboutus.html" class="w3-bar-item w3-button">About Us</a>
        <a href="carlisting.jsp" class="w3-bar-item w3-button">Job Listing</a>
        <a href="registerpage.html" class="w3-bar-item w3-button">Register</a>
        <a href="contactus.html" class="w3-bar-item w3-button">Contact Us</a>
        <a href="login.jsp" class="w3-bar-item w3-button">Log in</a>
        <a href="logout.jsp" class="w3-bar-item w3-button">Log out</a>
      </div>
    </div>
  </div>
      
    <form action="login" method="post">
        <h2>Login</h2>

        <!-- Display error message if it exists -->
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>

        <label>Username:</label>
        <input type="text" name="username" required><br>

        <label>Password:</label>
        <input type="password" name="password" required><br>

        <button type="submit">Login</button>
    </form>
</body>
</html>
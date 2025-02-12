<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Career Platform - Home</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="mystyle.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    body {font-family: "Times New Roman", Georgia, Serif;}
    h1, h2, h3, h4, h5, h6 {font-family: "Playfair Display"; letter-spacing: 5px;}
    
    /* Centering contact content and increasing font size */
    .contact-info {
      text-align: center;
      font-size: 22px;
    }

    .contact-info i {
      font-size: 30px;
    }

    .social-icons {
      text-align: center;
      margin-top: 20px;
    }
    .social-icons a {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 50px;
      height: 50px;
      font-size: 24px;
      text-decoration: none;
      border-radius: 50%;
      color: white;
      margin: 10px;
    }
    .fa-facebook { background: #3B5998; }
    .fa-instagram { background: linear-gradient(45deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888); }
    .fa-google { background: #dd4b39; }

    .username-display {
      padding: 8px;
      font-weight: bold;
      color: black;
    }

    .logout-button {
      background-color: red;
      color: white;
      padding: 8px 12px;
      border-radius: 5px;
      text-decoration: none;
      font-weight: bold;
    }

    .logout-button:hover {
      background-color: darkred;
    }

    footer {
        width: 100%;
        text-align: center;
        padding: 10px;
        background-color: grey;
        color: white;
        position: relative;
        bottom: 0;
        left: 0;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
      <a href="home.jsp" class="w3-bar-item w3-button">Career Platform</a>
      <div class="w3-right w3-hide-small">
        <a href="aboutus.jsp" class="w3-bar-item w3-button">About Us</a>
        <a href="carlisting.jsp" class="w3-bar-item w3-button">Job Listing</a>
        <a href="registerpage.jsp" class="w3-bar-item w3-button">Register</a>
        <a href="contactus.jsp" class="w3-bar-item w3-button">Contact Us</a>

        <% if (username != null) { %>
            <span class="w3-bar-item username-display">Welcome, <%= username %>!</span>
            <a href="logout.jsp" class="w3-bar-item logout-button">Log out</a>
        <% } else { %>
            <a href="login.jsp" class="w3-bar-item w3-button">Log in</a>
        <% } %>
      </div>
    </div>
  </div>

  <!-- Header -->
  <header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
    <img class="w3-image" src="image/officepeople.jpg" alt="Office People" width="1600" height="800">
    <div class="w3-display-bottomleft w3-padding-large w3-opacity">
      <h1 class="w3-xxlarge">Welcome to Career Platform</h1>
    </div>
  </header>

  <!-- Page content -->
  <div class="w3-content" style="max-width:1100px">
    <!-- About Section -->
    <div class="w3-row w3-padding-64" id="about">
      <div class="w3-col m6 w3-padding-large w3-hide-small">
        <img src="image/resume.jpg" class="w3-round w3-image w3-opacity-min" alt="Office Environment" width="600" height="750">
      </div>
      <div class="w3-col m6 w3-padding-large">
        <h1 class="w3-center">About Us</h1><br>
        <p class="w3-large">We are dedicated to connecting job seekers with their dream careers and helping employers find the right candidates. Start your career journey with us today!</p>
      </div>
    </div>
    <!-- Contact Section -->
    <div class="w3-container w3-padding-64 contact-info">
      <h1>Contact Us</h1>
      <p>Have questions? Reach out to us! &#128521;</p>
      <p class="w3-text-blue-grey w3-large"><b>Career Platform, Jalan Ilmu, UiTM Shah Alam, Selangor.</b></p>
    
      <p><i class="fa fa-envelope" style="margin-right:8px;"></i> Email: support@careerplatform.com</p>
      <p><i class="fas fa-phone-alt" style="margin-right:8px;"></i> Phone: +6013-456 7138</p>
    
      <div class="social-icons">
        <a href="https://www.facebook.com/yourprofile" class="fa-brands fa-facebook"></a>
        <a href="https://www.instagram.com/yourprofile" class="fa-brands fa-instagram"></a>
        <a href="https://www.google.com/" class="fa-brands fa-google"></a>
      </div>
    </div>
  
</body>
</html>


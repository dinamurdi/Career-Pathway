<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Career Platform - About Us</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="mystyle.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    body {
      font-family: "Times New Roman", Georgia, Serif;
    }
    h1, h2, h3, h4, h5, h6 {
      font-family: "Playfair Display"; 
      letter-spacing: 5px;
    }
    html {
      box-sizing: border-box;
    }
    *, *:before, *:after {
      box-sizing: inherit;
    }
    .about-section {
      padding: 50px;
      text-align: center;
      background-color: #50394c;
      color: white;
    }
    .about-section h1 {
      font-size: 30px;
    }
    .about-section p {
      font-size: 20px;
    }
    .row {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 20px;
      padding: 20px;
    }
    .column {
      flex: 1;
      min-width: 280px;
      max-width: 350px;
      text-align: center;
    }
    .column p {
      font-size: 18px;
    }
    .card {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      padding: 15px;
      border-radius: 10px;
      background: white;
    }
    .card img {
      width: 100%;
      border-radius: 10px;
    }
    .w3-container h3 {
      margin-top: 10px;
    }
    @media screen and (max-width: 650px) {
      .column {
        width: 100%;
        display: block;
      }
    }
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
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
      <a href="home.jsp" class="w3-bar-item w3-button">Career Platform</a>
      <div class="w3-right w3-hide-small">
        <a href="aboutus.jsp" class="w3-bar-item w3-button">About Us</a>
        <a href="joblisting.jsp" class="w3-bar-item w3-button">Job Listing</a>
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

  <!-- About Us Section -->
  <div class="about-section">
    <h1>About Us</h1>
    <p>Founded in 2024, Career Platform is dedicated to bridging the gap between job seekers and employers.</p>
    <p>Our mission is to provide a seamless and efficient job search experience for professionals across various industries.</p>
    <p>We believe in empowering individuals by connecting them with the right opportunities, helping businesses find top talent, and fostering a thriving career community.</p>
    <p>Whether you're just starting out or looking to advance your career, we’re here to support your journey.</p>
  </div>

  <!-- The Team -->
  <div class="w3-container w3-center w3-padding-32">
    <h2>Our Team</h2>
  </div>

  <!-- Team Members -->
  <div class="row">
    <!-- Member 1 -->
    <div class="column">
      <div class="card">
        <img src="image/naqiu.jpg" alt="Naqiuddin">
        <div class="w3-container">
          <h3>Naqiuddin</h3>
          <p class="w3-opacity">CEO & Founder</p>
          <p>naqiu56@yahoo.com</p>
        </div>
      </div>
    </div>

    <!-- Member 2 -->
    <div class="column">
      <div class="card">
        <img src="image/damia.jpg" alt="Damia">
        <div class="w3-container">
          <h3>Damia</h3>
          <p class="w3-opacity">Manager</p>
          <p>damiaaa856@gmail.com</p>
        </div>
      </div>
    </div>

    <!-- Member 3 -->
    <div class="column">
      <div class="card">
        <img src="image/wardina.jpeg" alt="Wardina">
        <div class="w3-container">
          <h3>Wardina</h3>
          <p class="w3-opacity">Assistant Manager</p>
          <p>wardina123@gmail.com</p>
        </div>
      </div>
    </div>
  </div>

</body>
</html>

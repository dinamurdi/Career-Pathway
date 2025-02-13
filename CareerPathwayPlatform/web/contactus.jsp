<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Career Platform - Contact Us</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link rel="stylesheet" href="mystyle.css">
  
  <style>
    body {
      font-family: "Times New Roman", Georgia, Serif;
    }
    h1, h2, h3, h4, h5, h6 {
      font-family: "Playfair Display"; 
      letter-spacing: 5px;
    }

    /* Layout: Image Left, Contact Details Right */
    .contact-container {
      display: flex;
      height: 100vh; /* Full viewport height */
    }

    .left-image {
      flex: 1;
      background: url("image/phone.jpg") center/cover no-repeat;
      height: 100vh;
    }

    .contact-details {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 50px;
      text-align: left;
      background-color: #f8f9fa;
    }

    .contact-details h1 {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .contact-details p {
      font-size: 16px;
      margin: 10px 0;
    }

    .contact-details i {
      font-size: 20px;
      margin-right: 10px;
    }

    /* Social Media Icons */
    .social-icons {
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

    /* Responsive Design */
    @media (max-width: 768px) {
      .contact-container {
        flex-direction: column;
      }
      .left-image {
        flex: none;
        height: 40vh;
      }
      .contact-details {
        text-align: center;
        padding: 30px;
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

  <!-- Contact Section -->
  <div class="contact-container">
    <div class="left-image"></div>
    <div class="contact-details">
      <h1>Contact Us</h1>
      <p>Have questions? Reach out to us! 😊</p>
      <p><i class="fa fa-map-marker-alt"></i> Career Platform, Jalan Ilmu, UiTM Shah Alam, Selangor.</p>
      <p><i class="fa fa-envelope"></i> Email: support@careerplatform.com</p>
      <p><i class="fas fa-phone-alt"></i> Phone: +6013-456 7138</p>
      
      <!-- Contact Form -->
      <form action="ContactServlet" method="post">
        <p><input class="w3-input w3-padding-16" type="text" placeholder="Name" required name="name"></p>
        <p><input class="w3-input w3-padding-16" type="email" placeholder="Enter your email" required name="email"></p>
        <p><input class="w3-input w3-padding-16" type="text" placeholder="Message / Special requirements" required name="message"></p>
        <p><button class="w3-button w3-light-grey w3-section" type="submit">SEND MESSAGE</button></p>
      </form>

      <!-- Social Media Links -->
      <div class="social-icons">
        <a href="https://www.facebook.com/yourprofile" class="fa-brands fa-facebook"></a>
        <a href="https://www.instagram.com/yourprofile" class="fa-brands fa-instagram"></a>
        <a href="https://www.google.com/" class="fa-brands fa-google"></a>
      </div>
    </div>
  </div>

</body>
</html>

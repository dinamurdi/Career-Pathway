<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve the logged-in username from the session
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="mystyle.css">  
    <title>Register</title>
    <style>
        body {
            font-family: 'Playfair Display', serif;
            background-color: #f7f7f7;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background-color: #e6f7ff; 
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Playfair Display', serif;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        .button-container {
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 12px 20px;
            background-color: #4caf50;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        .button:hover {
            background-color: #45a049;
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
    
    <div class="container">
        <h1>Register Your Career Here!</h1>
        <form action="ResgisterPageCustomerServlet" method="post">
            <input type="text" name="custName" placeholder="Customer Name" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="email" name="cemail" placeholder="Email" required>
            <input type="text" name="cpnum" placeholder="Phone Number" required>
            <input type="password" name="cpword" placeholder="Password" required>
            <input type="password" name="ccpword" placeholder="Confirm Password" required>
            <div class="button-container">
                <input type="submit" value="Register" class="button">
            </div>
        </form>
    </div>
</body>
</html>

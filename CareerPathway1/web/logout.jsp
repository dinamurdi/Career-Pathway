<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidate the session
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h2 {
            color: #333;
        }
        p {
            font-size: 18px;
            color: #555;
        }
        .login-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .login-btn:hover {
            background: #45a049;
        }
    </style>

    <meta http-equiv="refresh" content="5;url=home.jsp">
</head>
<body>
    <div class="container">
        <h2>You have logged out!</h2>
        <p>You will be redirected to the home page in 5 seconds.</p>
        <a href="home.jsp" class="login-btn">Go to Home</a>
    </div>
</body>
</html>

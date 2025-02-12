<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
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
        .logout-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background: #ff4d4d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .logout-btn:hover {
            background: #cc0000;
        }
    </style>

    <script>
        // Redirect after 5 second (5000 milliseconds)
        setTimeout(function () {
            window.location.href = "home.jsp";
        }, 5000);
    </script>
</head>
<body>
    <div class="container">
        <h2>Welcome!</h2>
        <p>You have successfully logged in, <strong><%= request.getSession().getAttribute("username") %></strong>!</p>
        <p>You will be redirected to the homepage in 5 seconds.</p>
        <a href="home.jsp" class="logout-btn">Go to Home</a>
    </div>
</body>
</html>

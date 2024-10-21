<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    
    <!-- Meta refresh to redirect after 5 seconds -->
    <meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/login">

    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #282c34;
            color: #ffffff;
            text-align: center;
        }
        h2 {
            color: #0f0;
        }
        a {
            color: #0f0;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div>
        <h2>Registration Successful</h2>

        <!-- Display success message if present -->
        <c:if test="${not empty successMessage}">
            <p style="color: green;">${successMessage}</p>
        </c:if>

        <p>A confirmation email has been sent to your registered email address.</p>
        <p>Please check your inbox for the OTP to complete your registration verification.</p>

        <!-- Redirect and link to login -->
        <p>You will be redirected to the login page in 5 seconds...</p>
        <p><a href="${pageContext.request.contextPath}/login">Click here to go to Login</a></p>
    </div>
</body>
</html>

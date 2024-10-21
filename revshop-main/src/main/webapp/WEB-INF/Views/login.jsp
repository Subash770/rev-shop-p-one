<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Quicksand', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('background-image.jpg') center/cover no-repeat;
        }

        section {
            position: relative;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login {
            width: 400px;
            background: #222;
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.9);
            text-align: center;
        }

        h2 {
            font-size: 2em;
            color: #0f0;
            text-transform: uppercase;
        }

        .form {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .inputBox {
            position: relative;
            width: 100%;
        }

        .inputBox input {
            width: 100%;
            background: #333;
            border: none;
            outline: none;
            padding: 25px 10px 7.5px;
            border-radius: 4px;
            color: #fff;
            font-weight: 500;
            font-size: 1em;
        }

        .inputBox input[type="submit"] {
            padding: 10px;
            background: linear-gradient(135deg, orange, yellow);
            color: #000;
            font-weight: 600;
            font-size: 1.35em;
            letter-spacing: 0.05em;
            cursor: pointer;
        }

        .inputBox input[type="submit"]:active {
            opacity: 0.6;
        }

        .links a {
            color: #fff;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <section>
        <div class="login">
            <h2>User Login</h2>
            <div class="form">
                <!-- Login form action should match the login controller mapping for the user -->
                <form id="login-form" method="POST" action="/login">
                    <div class="inputBox">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email" required>
                    </div>
                    <div class="inputBox">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="Password" required>
                    </div>
                    <div class="inputBox">
                        <label for="userType">User Type</label>
                        <select name="userType" id="userType" required>
                            <option value="" disabled selected>Select User Type</option>
                            <option value="admin">Admin</option>
                            <option value="seller">Seller</option>
                            <option value="buyer">Buyer</option>
                        </select>
                    </div>
                    <div class="links">
                        <a href="/registers">Don't have an account? Sign Up</a>
                    </div>
                    <div class="inputBox">
                        <input type="submit" value="Login">
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>

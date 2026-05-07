<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("username") != null) {
        response.sendRedirect("home.jsp");
        return;
    }
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Garage Management - Login</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1f4e79 0%, #2d7dd2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.25);
            padding: 48px 40px 40px;
            width: 380px;
        }

        .logo {
            text-align: center;
            margin-bottom: 32px;
        }

        .logo-icon {
            font-size: 48px;
            display: block;
            margin-bottom: 10px;
        }

        .logo h2 {
            color: #1f4e79;
            font-size: 22px;
            font-weight: 700;
        }

        .logo p {
            color: #888;
            font-size: 13px;
            margin-top: 4px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 11px 14px;
            border: 1.5px solid #cdd5e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.2s;
            outline: none;
        }

        input[type=text]:focus, input[type=password]:focus {
            border-color: #1f77d0;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #1f77d0;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
            transition: background 0.2s;
        }

        .btn-login:hover {
            background: #155fa0;
        }

        .error-msg {
            background: #ffeaea;
            color: #c0392b;
            border: 1px solid #f5c6cb;
            border-radius: 7px;
            padding: 10px 14px;
            font-size: 13px;
            margin-bottom: 18px;
            text-align: center;
        }

        .hint {
            text-align: center;
            font-size: 12px;
            color: #aaa;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="login-card">
    <div class="logo">
        <span class="logo-icon">🔧</span>
        <h2>Garage Management</h2>
        <p>Sign in to your account</p>
    </div>

    <% if (error != null) { %>
    <div class="error-msg"><%= error %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username"
                   placeholder="Enter your username" required autofocus />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Enter your password" required />
        </div>
        <button type="submit" class="btn-login">Sign In</button>
    </form>

    <p class="hint">Default: admin / admin123</p>
</div>
</body>
</html>

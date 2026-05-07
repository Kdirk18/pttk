<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Management</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, sans-serif;
            background: #f0f4f9;
            min-height: 100vh;
        }

        .navbar {
            background: #1f4e79;
            color: #fff;
            padding: 0 32px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 18px;
            font-weight: 700;
        }

        .navbar-brand span { font-size: 24px; }

        .navbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 14px;
        }

        .btn-home {
            background: rgba(255,255,255,0.2);
            color: #fff;
            border: none;
            padding: 7px 16px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s;
        }

        .btn-home:hover { background: rgba(255,255,255,0.35); }

        .btn-logout {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 7px 16px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s;
        }

        .btn-logout:hover { background: #c0392b; }

        .page-header {
            background: linear-gradient(135deg, #1f77d0 0%, #2d7dd2 100%);
            color: #fff;
            padding: 40px 32px 36px;
        }

        .breadcrumb {
            font-size: 13px;
            opacity: 0.8;
            margin-bottom: 8px;
        }

        .breadcrumb a { color: rgba(255,255,255,0.85); text-decoration: none; }
        .breadcrumb a:hover { text-decoration: underline; }

        .page-header h1 { font-size: 28px; }
        .page-header p  { font-size: 14px; opacity: 0.85; margin-top: 6px; }

        .content {
            max-width: 700px;
            margin: 60px auto;
            padding: 0 20px;
            text-align: center;
        }

        .placeholder-box {
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 60px 40px;
        }

        .placeholder-icon {
            font-size: 72px;
            margin-bottom: 20px;
        }

        .placeholder-box h2 {
            font-size: 22px;
            color: #1f4e79;
            margin-bottom: 12px;
        }

        .placeholder-box p {
            font-size: 14px;
            color: #888;
            line-height: 1.7;
            max-width: 400px;
            margin: 0 auto 28px;
        }

        .badge {
            display: inline-block;
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffc107;
            border-radius: 20px;
            padding: 6px 16px;
            font-size: 13px;
            font-weight: 600;
        }

        .btn-back {
            display: inline-block;
            margin-top: 24px;
            padding: 10px 24px;
            background: #1f77d0;
            color: #fff;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: background 0.2s;
        }

        .btn-back:hover { background: #155fa0; }
    </style>
</head>
<body>

<nav class="navbar">
    <div class="navbar-brand">
        <span>🔧</span> Garage Management
    </div>
    <div class="navbar-right">
        <a href="home.jsp" class="btn-home">⬅ Home</a>
        <a href="LogoutServlet" class="btn-logout">Logout</a>
    </div>
</nav>

<div class="page-header">
    <div class="breadcrumb">
        <a href="home.jsp">Home</a> &rsaquo; Customer Management
    </div>
    <h1>👥 Customer Management</h1>
    <p>Manage customer profiles, vehicles, and service history</p>
</div>

<div class="content">
    <div class="placeholder-box">
        <div class="placeholder-icon">🚧</div>
        <h2>Coming Soon</h2>
        <p>
            The Customer Management module is currently under development.
            It will include customer registration, vehicle tracking, and service history.
        </p>
        <span class="badge">⏳ Under Development</span>
        <br>
        <a href="home.jsp" class="btn-back">← Back to Home</a>
    </div>
</div>

</body>
</html>

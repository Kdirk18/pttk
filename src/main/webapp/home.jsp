<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Garage Management - Home</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, sans-serif;
            background: #f0f4f9;
            min-height: 100vh;
        }

        /* ── Navbar ── */
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
            gap: 16px;
            font-size: 14px;
        }

        .user-badge {
            background: rgba(255,255,255,0.15);
            padding: 6px 14px;
            border-radius: 20px;
        }

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

        /* ── Hero ── */
        .hero {
            background: linear-gradient(135deg, #1f4e79 0%, #2d7dd2 100%);
            color: #fff;
            text-align: center;
            padding: 56px 20px 48px;
        }

        .hero h1 { font-size: 32px; margin-bottom: 10px; }
        .hero p  { font-size: 15px; opacity: 0.85; }

        /* ── Module Grid ── */
        .section {
            max-width: 960px;
            margin: 0 auto;
            padding: 48px 20px 60px;
        }

        .section-title {
            font-size: 14px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #888;
            margin-bottom: 24px;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 24px;
        }

        .card {
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px 28px;
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 12px;
            transition: transform 0.15s, box-shadow 0.15s;
            border-top: 4px solid transparent;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.14);
        }

        .card.blue  { border-top-color: #1f77d0; }
        .card.green { border-top-color: #27ae60; }
        .card.orange{ border-top-color: #e67e22; }
        .card.purple{ border-top-color: #8e44ad; }

        .card-icon {
            font-size: 36px;
        }

        .card-title {
            font-size: 17px;
            font-weight: 700;
            color: #1f4e79;
        }

        .card-desc {
            font-size: 13px;
            color: #777;
            line-height: 1.5;
        }

        .card-arrow {
            margin-top: auto;
            font-size: 13px;
            font-weight: 600;
            color: #1f77d0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
    <div class="navbar-brand">
        <span>🔧</span> Garage Management
    </div>
    <div class="navbar-right">
        <span class="user-badge">👤 <%= username %></span>
        <a href="LogoutServlet" class="btn-logout">Logout</a>
    </div>
</nav>

<!-- Hero -->
<div class="hero">
    <h1>Welcome back, <%= username %>!</h1>
    <p>Select a module below to get started</p>
</div>

<!-- Module Cards -->
<div class="section">
    <div class="section-title">Management Modules</div>
    <div class="card-grid">

        <!-- Customer Management -->
        <a href="customer-management.jsp" class="card blue">
            <div class="card-icon">👥</div>
            <div class="card-title">Customer Management</div>
            <div class="card-desc">Add, search, and manage customer profiles and service history.</div>
            <div class="card-arrow">Open module →</div>
        </a>

        <!-- Supplier Management -->
        <a href="supplier-management.jsp" class="card green">
            <div class="card-icon">🏭</div>
            <div class="card-title">Supplier Management</div>
            <div class="card-desc">Manage suppliers, import spare parts, and process supplier payments.</div>
            <div class="card-arrow">Open module →</div>
        </a>

        <!-- Spare Parts -->
        <a href="add-part.jsp" class="card orange">
            <div class="card-icon">⚙️</div>
            <div class="card-title">Spare Parts</div>
            <div class="card-desc">Add new spare parts and manage the parts inventory catalog.</div>
            <div class="card-arrow">Open module →</div>
        </a>

        <!-- Search Catalog -->
        <a href="search-catalog.jsp" class="card purple">
            <div class="card-icon">🔍</div>
            <div class="card-title">Search Catalog</div>
            <div class="card-desc">Search across all services and spare parts in the system.</div>
            <div class="card-arrow">Open module →</div>
        </a>

    </div>
</div>

</body>
</html>

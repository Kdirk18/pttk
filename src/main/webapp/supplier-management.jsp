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
    <title>Supplier Management</title>
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
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
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
            max-width: 900px;
            margin: 0 auto;
            padding: 40px 20px 60px;
        }

        .section-title {
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #888;
            margin-bottom: 20px;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 28px 24px;
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            gap: 10px;
            border-left: 4px solid #27ae60;
            transition: transform 0.15s, box-shadow 0.15s;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        }

        .card-icon { font-size: 32px; }

        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #1f4e79;
        }

        .card-desc {
            font-size: 13px;
            color: #777;
            line-height: 1.5;
        }

        .card-arrow {
            margin-top: 6px;
            font-size: 13px;
            font-weight: 600;
            color: #27ae60;
        }
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
        <a href="home.jsp">Home</a> &rsaquo; Supplier Management
    </div>
    <h1>🏭 Supplier Management</h1>
    <p>Manage your suppliers, import spare parts, and handle payments</p>
</div>

<div class="content">
    <div class="section-title">Available Actions</div>
    <div class="card-grid">

        <a href="add-supplier.jsp" class="card">
            <div class="card-icon">➕</div>
            <div class="card-title">Add New Supplier</div>
            <div class="card-desc">Register a new supplier with contact details and tax information.</div>
            <div class="card-arrow">Go →</div>
        </a>

        <a href="ImportPartServlet" class="card">
            <div class="card-icon">📦</div>
            <div class="card-title">Import Spare Parts</div>
            <div class="card-desc">Create import invoices by selecting a supplier and adding parts.</div>
            <div class="card-arrow">Go →</div>
        </a>

        <a href="supplier-payment.jsp" class="card">
            <div class="card-icon">💳</div>
            <div class="card-title">Supplier Payments</div>
            <div class="card-desc">Process payments to suppliers for outstanding import invoices.</div>
            <div class="card-arrow">Go →</div>
        </a>

    </div>
</div>

</body>
</html>

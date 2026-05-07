<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Service, model.SparePart" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Item Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background: #f7f9fc;
        }

        .box {
            background: #fff;
            padding: 20px;
            width: 700px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        h1 {
            color: #1f4e79;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table, th, td {
            border: 1px solid #d6d6d6;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            width: 220px;
            background: #eaf2fb;
        }

        .back-link {
            display: inline-block;
            margin-top: 18px;
            text-decoration: none;
            color: white;
            background: #1f77d0;
            padding: 10px 16px;
            border-radius: 6px;
        }

        .back-link:hover {
            background: #155fa0;
        }

        .msg {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="box">
    <h1>Item Detail</h1>

    <div class="msg">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>

    <%
        Service service = (Service) request.getAttribute("service");
        SparePart part = (SparePart) request.getAttribute("part");
    %>

    <table>
        <% if (service != null) { %>
            <tr><th>Service Name</th><td><%= service.getServiceName() %></td></tr>
            <tr><th>Description</th><td><%= service.getDescription() %></td></tr>
            <tr><th>Estimated Duration</th><td><%= service.getEstimatedDuration() %> minutes</td></tr>
            <tr><th>Base Price</th><td><%= service.getBasePrice() %></td></tr>
            <tr><th>Status</th><td><%= service.getServiceStatus() %></td></tr>
        <% } else if (part != null) { %>
            <tr><th>Part Name</th><td><%= part.getPartName() %></td></tr>
            <tr><th>Description</th><td><%= part.getDescription() %></td></tr>
            <tr><th>Unit</th><td><%= part.getUnit() %></td></tr>
            <tr><th>Selling Price</th><td><%= part.getSalePrice() %></td></tr>
            <tr><th>Stock Quantity</th><td><%= part.getStockQuantity() %></td></tr>
            <tr><th>Status</th><td><%= part.getPartStatus() %></td></tr>
        <% } else { %>
            <tr><th>Message</th><td>No detail found.</td></tr>
        <% } %>
    </table>

    <a class="back-link" href="search-catalog.jsp">Back</a>
</div>
</body>
</html>
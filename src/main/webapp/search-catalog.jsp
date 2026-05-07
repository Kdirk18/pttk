<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Service, model.SparePart" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Services / Spare Parts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background: #f7f9fc;
        }

        h1 {
            color: #1f4e79;
        }

        .box {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        form {
            margin-bottom: 20px;
        }

        input[type=text] {
            width: 320px;
            padding: 10px;
            border: 1px solid #bbb;
            border-radius: 6px;
        }

        button {
            padding: 10px 18px;
            background: #1f77d0;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #155fa0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background: white;
        }

        table, th, td {
            border: 1px solid #d6d6d6;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background: #eaf2fb;
        }

        .msg {
            color: red;
            margin-top: 10px;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .view-link {
            text-decoration: none;
            color: white;
            background: #28a745;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .view-link:hover {
            background: #1f7f34;
        }
    </style>
</head>
<body>
<div class="box">
    <h1>Search Services / Spare Parts</h1>

    <form action="SearchCatalogServlet" method="get">
        <label><strong>Keyword:</strong></label>
        <input type="text" name="keyword"
               value="<%= request.getAttribute("keyword") != null ? request.getAttribute("keyword") : "" %>" />
        <button type="submit">Search</button>
    </form>

    <div class="msg">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>

    <%
        List<Service> services = (List<Service>) request.getAttribute("services");
        List<SparePart> parts = (List<SparePart>) request.getAttribute("parts");
        int no = 1;

        if ((services != null && !services.isEmpty()) || (parts != null && !parts.isEmpty())) {
    %>
    <table>
        <tr>
            <th>No.</th>
            <th>Type</th>
            <th>Name</th>
            <th>Price</th>
            <th>Short Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            if (services != null) {
                for (Service s : services) {
        %>
        <tr>
            <td><%= no++ %></td>
            <td>Service</td>
            <td><%= s.getServiceName() %></td>
            <td><%= s.getBasePrice() %></td>
            <td><%= s.getDescription() %></td>
            <td><%= s.getServiceStatus() %></td>
            <td>
                <a class="view-link" href="DetailServlet?type=service&id=<%= s.getServiceId() %>">View Detail</a>
            </td>
        </tr>
        <%
                }
            }

            if (parts != null) {
                for (SparePart p : parts) {
        %>
        <tr>
            <td><%= no++ %></td>
            <td>Spare Part</td>
            <td><%= p.getPartName() %></td>
            <td><%= p.getSalePrice() %></td>
            <td><%= p.getDescription() %></td>
            <td><%= p.getPartStatus() %></td>
            <td>
                <a class="view-link" href="DetailServlet?type=part&id=<%= p.getPartId() %>">View Detail</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <% } %>
</div>
</body>
</html>
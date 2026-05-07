<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.SparePart, model.ImportInvoiceItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Import Parts</title>
    <style>
        body { font-family: Arial; margin: 30px; background:#f7f9fc; }
        .box { background:#fff; padding:20px; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,.08);}
        table { border-collapse: collapse; width: 100%; margin-top: 15px; }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 8px; }
        button, a.btn { padding: 8px 14px; background:#2b79d0; color:#fff; text-decoration:none; border:none; border-radius:6px; cursor:pointer; }
        .msg { color:red; font-weight:bold; margin:10px 0; }
        input[type=text], input[type=number] { padding:8px; }
    </style>
</head>
<body>
<div class="box">
    <h2>Import Parts</h2>

    <div class="msg">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>

    <form action="ImportPartServlet" method="get">
        Part Name:
        <input type="text" name="partName"
               value="<%= request.getAttribute("partName") != null ? request.getAttribute("partName") : "" %>">
        <button type="submit">Find Part</button>
        <a class="btn" href="add-part.jsp">Add Part</a>
    </form>

    <%
        List<SparePart> parts = (List<SparePart>) request.getAttribute("parts");
        if (parts != null && !parts.isEmpty()) {
    %>
    <form action="ImportPartServlet" method="post">
        <table>
            <tr>
                <th>Select</th>
                <th>No.</th>
                <th>Part Name</th>
                <th>Unit</th>
                <th>Current Stock</th>
                <th>Reference Price</th>
                <th>Status</th>
            </tr>
            <%
                int no = 1;
                for (SparePart p : parts) {
            %>
            <tr>
                <td><input type="radio" name="partId" value="<%= p.getPartId() %>"></td>
                <td><%= no++ %></td>
                <td><%= p.getPartName() %></td>
                <td><%= p.getUnit() %></td>
                <td><%= p.getStockQuantity() %></td>
                <td><%= p.getSalePrice() %></td>
                <td><%= p.getPartStatus() %></td>
            </tr>
            <% } %>
        </table>

        <br>
        Quantity: <input type="number" name="quantity">
        Unit Price: <input type="number" step="0.01" name="unitPrice">
        <button type="submit" name="action" value="add">Add To Invoice</button>
        <button type="submit" name="action" value="confirm">Confirm</button>
    </form>
    <% } %>

    <%
        List<ImportInvoiceItem> cart = (List<ImportInvoiceItem>) session.getAttribute("importCart");
        if (cart != null && !cart.isEmpty()) {
    %>
    <h3>Current Import List</h3>
    <table>
        <tr>
            <th>No.</th>
            <th>Part Name</th>
            <th>Unit</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Line Amount</th>
        </tr>
        <%
            int i = 1;
            double total = 0;
            for (ImportInvoiceItem item : cart) {
                total += item.getLineAmount();
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= item.getPartName() %></td>
            <td><%= item.getUnit() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getUnitPrice() %></td>
            <td><%= item.getLineAmount() %></td>
        </tr>
        <% } %>
        <tr>
            <th colspan="5">Total Amount</th>
            <th><%= total %></th>
        </tr>
    </table>
    <% } %>
</div>
</body>
</html>
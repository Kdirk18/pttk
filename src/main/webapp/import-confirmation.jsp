<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.ImportInvoiceItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Import Confirmation</title>
    <style>
        body { font-family:Arial; margin:30px; background:#f7f9fc; }
        .box { background:#fff; padding:20px; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,.08);}
        table { border-collapse: collapse; width: 100%; margin-top: 15px; }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 8px; }
        .msg { color:green; font-weight:bold; margin-bottom:10px; }
        a.btn { padding:8px 14px; background:#2b79d0; color:#fff; text-decoration:none; border-radius:6px; display:inline-block; }
    </style>
</head>
<body>
<div class="box">
    <h2>Import Confirmation</h2>

    <p>Import Invoice ID: ${sessionScope.currentImportInvoiceId}</p>
    <p>Total Amount: ${sessionScope.currentImportTotal}</p>
    <p class="msg">${message}</p>

    <%
        List<ImportInvoiceItem> cart = (List<ImportInvoiceItem>) session.getAttribute("importCart");
        if (cart != null && !cart.isEmpty()) {
    %>
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
            for (ImportInvoiceItem item : cart) {
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
    </table>
    <% } %>

    <br>
    <a class="btn" href="ImportConfirmationServlet?action=print">Print Invoice</a>
    <a class="btn" href="supplier-payment.jsp">Pay Supplier</a>
</div>
</body>
</html>
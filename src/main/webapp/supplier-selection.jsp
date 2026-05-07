<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Supplier" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Supplier</title>
    <style>
        body { font-family: Arial; margin: 30px; background:#f7f9fc; }
        .box { background:#fff; padding:20px; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,.08);}
        table { border-collapse: collapse; width: 100%; margin-top: 15px; }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 8px; }
        button, a.btn { padding: 8px 14px; background:#2b79d0; color:#fff; text-decoration:none; border:none; border-radius:6px; cursor:pointer; }
        .msg { color:red; font-weight:bold; margin:10px 0; }
        input[type=text] { padding:8px; width:280px; }
    </style>
</head>
<body>
<div class="box">
    <h2>Select Supplier</h2>

    <form action="SupplierSelectionServlet" method="get">
        Supplier Name:
        <input type="text" name="supplierName"
               value="<%= request.getAttribute("supplierName") != null ? request.getAttribute("supplierName") : "" %>" />
        <button type="submit">Find Supplier</button>
        <a class="btn" href="add-supplier.jsp">Add Supplier</a>
    </form>

    <div class="msg">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>

    <%
        List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
        if (suppliers != null && !suppliers.isEmpty()) {
    %>
    <form action="ImportPartServlet" method="post">
        <table>
            <tr>
                <th>Select</th>
                <th>No.</th>
                <th>Supplier Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Tax Code</th>
                <th>Status</th>
            </tr>
            <%
                int no = 1;
                for (Supplier s : suppliers) {
            %>
            <tr>
                <td><input type="radio" name="supplierId" value="<%= s.getSupplierId() %>"></td>
                <td><%= no++ %></td>
                <td><%= s.getSupplierName() %></td>
                <td><%= s.getPhoneNumber() %></td>
                <td><%= s.getEmail() %></td>
                <td><%= s.getAddress() %></td>
                <td><%= s.getTaxCode() %></td>
                <td><%= s.getSupplierStatus() %></td>
            </tr>
            <% } %>
        </table>
        <br>
        <button type="submit" name="action" value="chooseSupplier">Continue</button>
    </form>
    <% } %>
</div>
</body>
</html>
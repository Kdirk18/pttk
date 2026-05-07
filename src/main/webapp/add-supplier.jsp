<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Supplier</title>
    <style>
        body { font-family:Arial; margin:30px; background:#f7f9fc; }
        .box { background:#fff; padding:20px; border-radius:10px; width:650px; box-shadow:0 2px 8px rgba(0,0,0,.08); }
        input[type=text], input[type=email] { width: 320px; padding:8px; margin-top:4px; }
        .err { color:red; font-size:14px; font-weight:bold; display:block; margin-top:4px; }
        button, a.btn { padding:8px 14px; background:#2b79d0; color:#fff; text-decoration:none; border:none; border-radius:6px; cursor:pointer; }
    </style>
</head>
<body>
<div class="box">
    <h2>Add Supplier</h2>

    <form action="AddSupplierServlet" method="post">
        Supplier Name:<br>
        <input type="text" name="supplierName"
               value="<%= request.getAttribute("supplierName") != null ? request.getAttribute("supplierName") : "" %>">
        <span class="err"><%= request.getAttribute("errorSupplierName") != null ? request.getAttribute("errorSupplierName") : "" %></span>
        <br><br>

        Phone Number:<br>
        <input type="text" name="phoneNumber"
               value="<%= request.getAttribute("phoneNumber") != null ? request.getAttribute("phoneNumber") : "" %>">
        <span class="err"><%= request.getAttribute("errorPhoneNumber") != null ? request.getAttribute("errorPhoneNumber") : "" %></span>
        <br><br>

        Email:<br>
        <input type="email" name="email"
               value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
        <br><br>

        Address:<br>
        <input type="text" name="address"
               value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>">
        <br><br>

        Tax Code:<br>
        <input type="text" name="taxCode"
               value="<%= request.getAttribute("taxCode") != null ? request.getAttribute("taxCode") : "" %>">
        <br><br>

        <button type="submit">Save Supplier</button>
        <a class="btn" href="supplier-selection.jsp">Back</a>
    </form>
</div>
</body>
</html>
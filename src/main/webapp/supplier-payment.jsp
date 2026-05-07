<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier Payment</title>
    <style>
        body { font-family:Arial; margin:30px; background:#f7f9fc; }
        .box { background:#fff; padding:20px; border-radius:10px; width:650px; box-shadow:0 2px 8px rgba(0,0,0,.08); }
        .msg { color:red; font-weight:bold; margin-bottom:15px; }
        .ok { color:green; font-weight:bold; margin-top:15px; }
        button { padding:8px 14px; background:#2b79d0; color:#fff; border:none; border-radius:6px; cursor:pointer; }
    </style>
</head>
<body>
<div class="box">
    <h2>Supplier Payment</h2>

    <p class="msg">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </p>

    <form action="SupplierPaymentServlet" method="post">
        Invoice Amount:
        <input type="text" name="amount" value="${sessionScope.currentImportTotal}" readonly><br><br>

        Payment Method:
        <select name="paymentMethod">
            <option value="">-- Select Payment Method --</option>
            <option value="Cash">Cash</option>
            <option value="Bank Transfer">Bank Transfer</option>
        </select><br><br>

        Note:<br>
        <textarea name="paymentNote" rows="4" cols="40"></textarea><br><br>

        <button type="submit">Confirm Payment</button>
    </form>

    <p class="ok">${message}</p>
</div>
</body>
</html>
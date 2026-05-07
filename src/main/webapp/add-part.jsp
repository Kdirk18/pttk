<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Spare Part</title>
    <style>
        body { font-family:Arial; margin:30px; background:#f7f9fc; }
        .box { background:#fff; padding:20px; border-radius:10px; width:650px; box-shadow:0 2px 8px rgba(0,0,0,.08); }
        input[type=text], input[type=number] { width: 320px; padding:8px; margin-top:4px; }
        .err { color:red; font-size:14px; font-weight:bold; display:block; margin-top:4px; }
        button, a.btn { padding:8px 14px; background:#2b79d0; color:#fff; text-decoration:none; border:none; border-radius:6px; cursor:pointer; }
    </style>
</head>
<body>
<div class="box">
    <h2>Add Spare Part</h2>

    <form action="AddPartServlet" method="post">
        Part Name:<br>
        <input type="text" name="partName"
               value="<%= request.getAttribute("partName") != null ? request.getAttribute("partName") : "" %>">
        <span class="err"><%= request.getAttribute("errorPartName") != null ? request.getAttribute("errorPartName") : "" %></span>
        <br><br>

        Description:<br>
        <input type="text" name="description"
               value="<%= request.getAttribute("description") != null ? request.getAttribute("description") : "" %>">
        <br><br>

        Unit:<br>
        <input type="text" name="unit"
               value="<%= request.getAttribute("unit") != null ? request.getAttribute("unit") : "" %>">
        <span class="err"><%= request.getAttribute("errorUnit") != null ? request.getAttribute("errorUnit") : "" %></span>
        <br><br>

        Reference Price:<br>
        <input type="number" step="0.01" name="referencePrice"
               value="<%= request.getAttribute("referencePrice") != null ? request.getAttribute("referencePrice") : "" %>">
        <span class="err"><%= request.getAttribute("errorReferencePrice") != null ? request.getAttribute("errorReferencePrice") : "" %></span>
        <br><br>

        Opening Stock:<br>
        <input type="number" name="openingStock"
               value="<%= request.getAttribute("openingStock") != null ? request.getAttribute("openingStock") : "" %>">
        <span class="err"><%= request.getAttribute("errorOpeningStock") != null ? request.getAttribute("errorOpeningStock") : "" %></span>
        <br><br>

        <button type="submit">Save Part</button>
        <a class="btn" href="import-part.jsp">Back</a>
    </form>
</div>
</body>
</html>
package controller;

import dao.SupplierDAO;
import model.Supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/SupplierSelectionServlet")
public class SupplierSelectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String supplierName = request.getParameter("supplierName");
        if (supplierName == null) supplierName = "";

        SupplierDAO dao = new SupplierDAO();
        List<Supplier> suppliers = dao.findByName(supplierName);

        request.setAttribute("suppliers", suppliers);
        request.getRequestDispatcher("supplier-selection.jsp").forward(request, response);
    }
}
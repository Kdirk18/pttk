package controller;

import dao.SupplierDAO;
import model.Supplier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddSupplierServlet")
public class AddSupplierServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Supplier supplier = new Supplier();
        supplier.setSupplierName(request.getParameter("supplierName"));
        supplier.setPhoneNumber(request.getParameter("phoneNumber"));
        supplier.setEmail(request.getParameter("email"));
        supplier.setAddress(request.getParameter("address"));
        supplier.setTaxCode(request.getParameter("taxCode"));
        supplier.setSupplierStatus("Active");

        SupplierDAO dao = new SupplierDAO();
        dao.insertSupplier(supplier);

        response.sendRedirect("supplier-selection.jsp");
    }
}
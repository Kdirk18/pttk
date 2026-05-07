package controller;

import dao.ImportInvoiceDAO;
import dao.SparePartDAO;
import dao.SupplierPaymentDAO;
import model.ImportInvoiceItem;
import model.SupplierPayment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/SupplierPaymentServlet")
public class SupplierPaymentServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer invoiceId = (Integer) session.getAttribute("currentImportInvoiceId");
        Integer supplierId = (Integer) session.getAttribute("selectedSupplierId");
        Double totalAmount = (Double) session.getAttribute("currentImportTotal");
        List<ImportInvoiceItem> cart = (List<ImportInvoiceItem>) session.getAttribute("importCart");

        if (invoiceId == null || supplierId == null || totalAmount == null) {
            response.sendRedirect("supplier-selection.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        String note = request.getParameter("paymentNote");

        SupplierPayment payment = new SupplierPayment();
        payment.setImportInvoiceId(invoiceId);
        payment.setSupplierId(supplierId);
        payment.setPaymentDate(new Date());
        payment.setAmount(totalAmount);
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus("Paid");
        payment.setNote(note);

        SupplierPaymentDAO paymentDAO = new SupplierPaymentDAO();
        paymentDAO.insertPayment(payment);

        ImportInvoiceDAO invoiceDAO = new ImportInvoiceDAO();
        invoiceDAO.updatePaymentStatus(invoiceId, "Paid");

        SparePartDAO partDAO = new SparePartDAO();
        if (cart != null) {
            for (ImportInvoiceItem item : cart) {
                partDAO.updateStock(item.getPartId(), item.getQuantity());
            }
        }

        session.removeAttribute("importCart");
        request.setAttribute("message", "Import completed successfully.");
        request.getRequestDispatcher("supplier-payment.jsp").forward(request, response);
    }
}
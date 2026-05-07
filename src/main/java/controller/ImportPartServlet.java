package controller;

import dao.ImportInvoiceDAO;
import dao.SparePartDAO;
import model.ImportInvoice;
import model.ImportInvoiceItem;
import model.SparePart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet("/ImportPartServlet")
public class ImportPartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String partName = request.getParameter("partName");
        SparePartDAO dao = new SparePartDAO();
        List<SparePart> parts = dao.findByKeyword(partName == null ? "" : partName);

        request.setAttribute("parts", parts);
        request.getRequestDispatcher("import-part.jsp").forward(request, response);
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if ("chooseSupplier".equals(action)) {
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            session.setAttribute("selectedSupplierId", supplierId);
            response.sendRedirect("import-part.jsp");
            return;
        }

        List<ImportInvoiceItem> cart = (List<ImportInvoiceItem>) session.getAttribute("importCart");
        if (cart == null) cart = new ArrayList<>();

        if ("add".equals(action)) {
            int partId = Integer.parseInt(request.getParameter("partId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));

            SparePartDAO partDAO = new SparePartDAO();
            SparePart part = partDAO.findById(partId);

            if (part != null) {
                ImportInvoiceItem item = new ImportInvoiceItem(
                        part.getPartId(),
                        part.getPartName(),
                        part.getUnit(),
                        quantity,
                        unitPrice
                );
                cart.add(item);
            }

            session.setAttribute("importCart", cart);
            response.sendRedirect("import-part.jsp");
            return;
        }

        if ("confirm".equals(action)) {
            Integer supplierId = (Integer) session.getAttribute("selectedSupplierId");
            if (supplierId == null) {
                response.sendRedirect("supplier-selection.jsp");
                return;
            }

            ImportInvoice invoice = new ImportInvoice();
            invoice.setSupplierId(supplierId);
            invoice.setInvoiceNumber("IMP-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            invoice.setInvoiceDate(new Date());
            invoice.setPaymentStatus("Unpaid");
            invoice.setNote("");
            invoice.setItems(cart);
            invoice.calculateTotal();

            ImportInvoiceDAO invoiceDAO = new ImportInvoiceDAO();
            int invoiceId = invoiceDAO.insertInvoice(invoice);

            for (ImportInvoiceItem item : cart) {
                item.setImportInvoiceId(invoiceId);
                invoiceDAO.insertInvoiceItem(item);
            }

            session.setAttribute("currentImportInvoiceId", invoiceId);
            session.setAttribute("currentImportTotal", invoice.getTotalAmount());

            response.sendRedirect("import-confirmation.jsp");
        }
    }
}
package controller;

import dao.SparePartDAO;
import model.SparePart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddPartServlet")
public class AddPartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SparePart part = new SparePart();
        part.setPartName(request.getParameter("partName"));
        part.setDescription(request.getParameter("description"));
        part.setUnit(request.getParameter("unit"));
        part.setSalePrice(Double.parseDouble(request.getParameter("referencePrice")));
        part.setStockQuantity(Integer.parseInt(request.getParameter("openingStock")));
        part.setPartStatus("Active");

        SparePartDAO dao = new SparePartDAO();
        dao.insertPart(part);

        response.sendRedirect("import-part.jsp");
    }
}
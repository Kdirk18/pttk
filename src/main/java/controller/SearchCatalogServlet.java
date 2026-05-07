package controller;

import dao.ServiceDAO;
import dao.SparePartDAO;
import model.Service;
import model.SparePart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchCatalogServlet")
public class SearchCatalogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {
            request.setAttribute("message", "Keyword must not be empty.");
            request.getRequestDispatcher("search-catalog.jsp").forward(request, response);
            return;
        }

        ServiceDAO serviceDAO = new ServiceDAO();
        SparePartDAO sparePartDAO = new SparePartDAO();

        List<Service> services = serviceDAO.findByKeyword(keyword.trim());
        List<SparePart> parts = sparePartDAO.findByKeyword(keyword.trim());

        if ((services == null || services.isEmpty()) && (parts == null || parts.isEmpty())) {
            request.setAttribute("message", "No service or spare part matches the keyword.");
        }

        request.setAttribute("services", services);
        request.setAttribute("parts", parts);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("search-catalog.jsp").forward(request, response);
    }
}
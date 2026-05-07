package controller;

import dao.ServiceDAO;
import dao.SparePartDAO;
import model.Service;
import model.SparePart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        String idRaw = request.getParameter("id");

        if (type == null || idRaw == null || idRaw.trim().isEmpty()) {
            response.sendRedirect("search-catalog.jsp");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idRaw);
        } catch (NumberFormatException e) {
            response.sendRedirect("search-catalog.jsp");
            return;
        }

        if ("service".equalsIgnoreCase(type)) {
            ServiceDAO dao = new ServiceDAO();
            Service service = dao.findById(id);
            request.setAttribute("service", service);
        } else if ("part".equalsIgnoreCase(type)) {
            SparePartDAO dao = new SparePartDAO();
            SparePart part = dao.findById(id);
            request.setAttribute("part", part);
        } else {
            response.sendRedirect("search-catalog.jsp");
            return;
        }

        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }
}
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/ImportConfirmationServlet")
public class ImportConfirmationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("print".equals(action)) {
            request.setAttribute("message", "Invoice printed successfully.");
        }
        request.getRequestDispatcher("import-confirmation.jsp").forward(request, response);
    }
}
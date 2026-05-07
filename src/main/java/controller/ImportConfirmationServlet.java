package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
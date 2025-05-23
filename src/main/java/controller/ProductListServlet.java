package controller;

import dao.IProductDAO;
import dao.ProductDAOImpl;
import beans.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/product-list")
public class ProductListServlet extends HttpServlet {
    IProductDAO dao = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Product> listP = dao.selectAllProduct();
        req.setAttribute("listP", listP);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}


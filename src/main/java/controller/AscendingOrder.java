package controller;

import java.io.IOException;
import java.util.List;

import beans.Product;
import dao.DAOFactory;
import dao.IProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AscendingOrder
 */
public class AscendingOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AscendingOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Product> list = (List<Product>) session.getAttribute("listP");
		IProductDAO dao = DAOFactory.getInstance().getProductDAO();
		list = dao.ascPrice();
//		getServletContext().setAttribute("listPAfterFinding", listPAfterFinding);
		request.setAttribute("listP", list);
		request.getRequestDispatcher("./product.jsp").forward(request, response);
		// response.sendRedirect("./product.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

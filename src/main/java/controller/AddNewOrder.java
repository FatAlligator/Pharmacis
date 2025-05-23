package controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import beans.Account;
import beans.Order;
import beans.OrderDetail;
import dao.DAOFactory;
import dao.ICustomerDAO;
import dao.IOrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/customer/AddNewOrder")
public class AddNewOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewOrder() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String orderID = UUID.randomUUID().toString();
		String ordererEmail = request.getParameter("ordererEmail");
		String addressShipping = request.getParameter("adr");

		ICustomerDAO dao = DAOFactory.getInstance().getCustomerDAO();
		Account acc = dao.findCustomerByEmail(ordererEmail);

		if (acc == null) {
			request.setAttribute("error", "❌ Email không tồn tại. Vui lòng kiểm tra lại.");
			request.getRequestDispatcher("/customer/order.jsp").forward(request, response);
			return;
		}

		HttpSession session = request.getSession();
		Order sessionOrder = (Order) session.getAttribute("order");
		if (sessionOrder == null || sessionOrder.getOrderDetails().isEmpty()) {
			request.setAttribute("error", "❌ Giỏ hàng trống. Vui lòng thêm sản phẩm trước khi đặt hàng.");
			request.getRequestDispatcher("/customer/order.jsp").forward(request, response);
			return;
		}

		// Lưu đơn hàng mới
		Order newOrder = new Order(orderID, acc, addressShipping, sessionOrder.getOrderDetails());
		IOrderDAO orderDAO = DAOFactory.getInstance().getOrderDAO();
		orderDAO.saveOrder(newOrder);

		// Xóa giỏ hàng khỏi session
		session.removeAttribute("order");

		response.sendRedirect("order-succeed.jsp");
	}
}

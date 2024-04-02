package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDao;
import DAO.Dao;
import Model.Account;
import Model.Cart;

/**
 * Servlet implementation class CartItemController
 */
@WebServlet(urlPatterns = "/cartItem")
public class CartItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartItemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("acc");
		int id = acc.getUser_id();
		CartDao dao = new CartDao();
		List<Cart> list = dao.getCartItem(id);
		
		// so item trong gio
		int count = dao.countCartItem();
		
		request.setAttribute("listC", list);
		request.setAttribute("count", count);
		request.getRequestDispatcher("CartItem.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package Controller;

import java.io.IOException;
import java.util.ArrayList;
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
import Model.Product;

/**
 * Servlet implementation class DetailProductController
 */
@WebServlet(name = "DetailProductController", urlPatterns = "/detail")
public class DetailProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Dao dao = new Dao();
		
		String id =request.getParameter("pid");
		if(id != null) {
			HttpSession session = request.getSession();
			session.setAttribute("pid", id);
		}
		
		
//		int id = Integer.parseInt(id1);
		Product product = dao.getProduct(id);
		
		String []size = product.listSize();
		
		request.setAttribute(id, product);
		request.setAttribute("listSize", size);
		request.setAttribute("product", product);
		request.getRequestDispatcher("DetailProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDao daoC = new CartDao();
		Dao dao = new Dao(); 
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("pid");
		if(session.getAttribute("acc") != null) {
			Product product = dao.getProduct(id);
			
			String size = request.getParameter("sizeProduct");
			String quantity = request.getParameter("slProduct");
			double price = Double.parseDouble(quantity) * product.getPrice(); 
			Account user = (Account) session.getAttribute("acc");
			int id_user = user.getUser_id();
			String []size1 = product.listSize();
			
			String btnRgt = request.getParameter("btn");
			if(btnRgt.equals("Mua ngay")) {
				if(daoC.checkExistsP(id) != null) {
					Cart cart = daoC.checkExistsP(id);
					Double quantityL = Double.parseDouble(quantity) + cart.getQuantity();
					price = cart.getPrice_one() * quantityL;
					daoC.updateCartItem(id_user, id, quantityL, price);
					response.sendRedirect("cartItem?pid="+id);
				}else {
					daoC.addCartItem(id_user, id, quantity, price, size);
					response.sendRedirect("cartItem?pid="+id);					
				}
			}
			else{
				if(daoC.checkExistsP(id) != null) {
					Cart cart = daoC.checkExistsP(id);
					Double quantityL = Double.parseDouble(quantity) + cart.getQuantity();
					price = cart.getPrice_one() * quantityL;
					request.setAttribute("id", product);
					request.setAttribute("listSize", size1);
					request.setAttribute("product", product);
					
					request.setAttribute("pid", id);
					request.setAttribute("sl", quantity);
					daoC.updateCartItem(id_user, id, quantityL, price);
					request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px; margin-left: 65px;font-size: 12px'>\r\n"
							+ "        <h3 style='color: #4b4b4b;'>Đã thêm sản phẩm vào giỏ hàng</h3>\r\n"
							+ "    </div>");
					request.getRequestDispatcher("DetailProduct.jsp").forward(request, response);						
				}else {
					request.setAttribute("id", product);
					request.setAttribute("listSize", size1);
					request.setAttribute("product", product);
					
					request.setAttribute("pid", id);
					request.setAttribute("sl", quantity);
					daoC.addCartItem(id_user, id, quantity, price, size);
					request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px; margin-left: 65px;font-size: 12px'>\r\n"
							+ "        <h3 style='color: #4b4b4b;'>Đã thêm sản phẩm vào giỏ hàng</h3>\r\n"
							+ "    </div>");
					request.getRequestDispatcher("DetailProduct.jsp").forward(request, response);
				}
			}
			
		}else {
			session.setAttribute("curPage", "detail?pid=" + id);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
		
	}

}

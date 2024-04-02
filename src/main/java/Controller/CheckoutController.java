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
 * Servlet implementation class CheckoutController
 */
@WebServlet(urlPatterns = "/checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(); 
	     HttpSession accSession = request.getSession(false);
	     Account acc =(Account) accSession.getAttribute("acc");
	     if(acc != null) {
	    	 CartDao dao = new CartDao();
	    	 String url = request.getParameter("data");
	    	 String []product = url.split("-");
	    	 String data = "";
	    	 int dem = 0;
	    	 for (String item : product) {
	    		 dem++;
				data += "cart_id = " + item;
				if(product.length > dem) {
					data += " or ";
				}
			}
	    	 
	    	 List<Cart> listC = dao.getCartItemCo(data);
	    	 double priceAll = 0;
	    	 for (Cart cart : listC) {
				priceAll += cart.getPrice();
			}
	    	 session.setAttribute("data", url);
	    	 request.setAttribute("price", priceAll);
	    	 request.setAttribute("listC", listC);
	    	 request.getRequestDispatcher("Checkout.jsp").forward(request, response);	    	 	    	 
	     }else {
	    	 request.getRequestDispatcher("Login.jsp").forward(request, response);	   
	     }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

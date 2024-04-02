package Controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDao;
import DAO.OrderDao;
import Model.Account;
import Model.Cart;

/**
 * Servlet implementation class CheckoutCntController
 */
@WebServlet(urlPatterns = "/checkoutCnt")
public class CheckoutCntController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutCntController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
	     HttpSession accSession = request.getSession(false);
	     Account acc =(Account) accSession.getAttribute("acc");
		String fullname = request.getParameter("firstname");
		String phone = request.getParameter("phone");
		String adrress = request.getParameter("address");
		String city = request.getParameter("city");
		String delivery = request.getParameter("paymentMethod");
		String url = "";
		if(session.getAttribute("data")!=null) {
			url =(String) session.getAttribute("data");
		}else if(request.getParameter("data") != null) {
			
			url = request.getParameter("data");
		}
		
		if(acc != null) {
			if(!fullname.equals("") && !phone.equals("") && !adrress.equals("") && !city.equals("")) {
				 CartDao dao = new CartDao();
				 OrderDao oDao = new OrderDao();
		    	 String []product = url.split("-");
		    	 String data = "";
		    	 String deleId = "";
		    	 int dem = 0;
		    	 for (String item : product) {
		    		 dem++;
					data += "cart_id = " + item;
					deleId += item;
					if(product.length > dem) {
						data += " or ";
						deleId += ", ";
					}
				}
		    	 int id_order = oDao.addOrder(acc.getUser_id(), delivery);
		    	 
		    	 List<Cart> listC = dao.getCartItemCo(data);
		    	 String query = "";
		    	 for (int i = 0;i < listC.size(); i++) {
		    		query += " (" + listC.get(i).getId_product() + ", '" + listC.get(i).getName() +
		    				"', " + listC.get(i).getPrice() + ", " + listC.get(i).getQuantity() +
		    				", '" + listC.get(i).getImg() + "', '" + listC.get(i).getSize() +
		    				"', " + id_order + ")";
		    		if(listC.size()-1 > i) {
		    			query += ", ";
		    		}
				}
		    	 
		    	 oDao.infoOrder(fullname, phone, adrress, city, id_order);
		    	 oDao.addOrderDetail(query);
		    	 request.setAttribute("mess", "Dat hang thanh cong");
		    	 
		    	 // xoa sp di
		    	 dao.deleteItemOrder(deleId);
		    	 
		    	 session.removeAttribute("data");
		    	 request.getRequestDispatcher("cartItem").forward(request, response);
		    	 
		    	 
			}else {
				request.setAttribute("mess", "Vui lòng nhập đủ thông tin");
			}
		}else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);	
		}
	}

}

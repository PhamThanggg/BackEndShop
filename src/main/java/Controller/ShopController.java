package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DAO.ProductDao;
import Model.Product;

/**
 * Servlet implementation class ProductController
 */
@WebServlet(urlPatterns = "/shop")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ProductDao dao = new ProductDao();
		int productLoad = 12; // so sp lay ra
		int countP = 0; // dem so san pham thoa man
		int index = 1; // trang hien tai
		List<Product> listP = new ArrayList<Product>();
		
		String priceP = request.getParameter("price");
		if(priceP != null) {
			String []s = priceP.split("-");
			countP = dao.countP(s[0], s[1]);
			listP = dao.getProductPrice(index, productLoad, s[0], s[1]);
		}else {
			countP = dao.countP();
			String indexPage = request.getParameter("index");
			if(indexPage == null) {
				indexPage = "1";
			}
			index = Integer.parseInt(indexPage);
			
			listP = dao.getAllProduct(index, productLoad);
		}
		
		
		
		int soPage = countP/productLoad;
		if(countP % productLoad != 0) {
			soPage++;
		}
		
		request.setAttribute("listP", listP);
		request.setAttribute("index", index);
		request.setAttribute("soPage", soPage);
		request.getRequestDispatcher("Shop.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

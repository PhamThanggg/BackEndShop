package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDao;
import Model.Product;

/**
 * Servlet implementation class SearchController
 */
@WebServlet(urlPatterns = "/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String search = request.getParameter("search");
		ProductDao dao = new ProductDao();
		int productLoad = 12; // so sp lay ra
		int countP = 0; // dem so san pham thoa man
		int index = 1; // trang hien tai
		List<Product> listP = new ArrayList<Product>(); 
		if(search != null) {
			String indexPage = request.getParameter("index");
			if(indexPage == null) {
				indexPage = "1";
			}
			index = Integer.parseInt(indexPage);
			listP = dao.getProductSearch(index, productLoad, search);
			countP = dao.countP(search);
			int soPage = countP/productLoad;
			if(countP % productLoad != 0) {
				soPage++;
					
			}
			request.setAttribute("listP", listP);
			request.setAttribute("index", index);
			request.setAttribute("soPage", soPage);
			request.setAttribute("name", search);
			request.getRequestDispatcher("Shop.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("shop").forward(request, response);
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

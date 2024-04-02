package Controller;

import java.io.IOException;
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
 * Servlet implementation class AdminController
 */
@WebServlet(urlPatterns = "/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Dao dao = new Dao();
		ProductDao pdao = new ProductDao();
		int totalP = dao.getTotalAccount();
		int totalU =dao.getTotalAccount();
		List<Product> listP = pdao.getNewProduct(5);
		List<Product> listS = pdao.getSellMax(5);
		
		request.setAttribute("listP", listP);
		request.setAttribute("listS", listS);
		request.setAttribute("totalP", totalP);
		request.setAttribute("totalU", totalU);
		request.getRequestDispatcher("Admin.jsp").forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

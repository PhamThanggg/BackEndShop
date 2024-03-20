package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import Model.Product;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = "/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Dao dao = new Dao();
		PrintWriter out = response.getWriter();
		
		int countAll = dao.getTotalAccount();
		int count = 1;
		int count1 = 5;
		int count2 = 9;
		List<Product> listNewP1 = dao.getNewProduct12(count);
		List<Product> listNewP2 = dao.getNewProduct12(count1);
		List<Product> listNewP3 = dao.getNewProduct12(count2);
		//ban chay nhat
		List<Product> listHot = dao.getHotDealProduct();
		// giam gia nhieu nhat
		List<Product> listDiscount = dao.getHotDealProduct();
		
		request.setAttribute("listNewP1", listNewP1);
		request.setAttribute("listNewP2", listNewP2);
		request.setAttribute("listNewP3", listNewP3);
		request.setAttribute("listHot", listHot);
		request.setAttribute("listDiscount", listDiscount);
		request.getRequestDispatcher("Home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

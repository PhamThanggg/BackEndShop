	package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import Model.Account;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(name = "LoginController", urlPatterns = "/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		String btnRgt = request.getParameter("btn");
		response.setContentType("text/html;charset=UTF-8");
		
		// lay thong tin p
		try (PrintWriter out = response.getWriter()) {
//			if("Đăng nhập".equals(btnRgt)) {
				if(!uname.equals("") && !pass.equals("")) {
					Dao dao = new Dao();
					Account a = dao.login(uname, pass);
					if(a!=null) {
						// tao, day tai khoan len session
						HttpSession session = request.getSession();
						session.setAttribute("acc", a);
						
						if(a.getIs_admin()==1) {
							if(session.getAttribute("curPage")!= null) {
								String crPage =(String) session.getAttribute("curPage");
								session.removeAttribute("curPage");
								response.sendRedirect(crPage);
							}else {
								response.sendRedirect("admin");;
							}
						}else {
							if(session.getAttribute("curPage")!= null) {
								String crPage =(String) session.getAttribute("curPage");
								session.removeAttribute("curPage");
								response.sendRedirect(crPage);
							}else {
								request.getRequestDispatcher("home").forward(request, response);
							}
							
						}
					}else {
						request.setAttribute("mes", "<div class='mes' style='width: 56.58%; height: 50px; background-color: rgb(250, 231, 207); line-height: 50px; margin-left: 65px;font-size: 12px;\r\n"
								+ "    text-align: center;'>\r\n"
								+ "        <h3 style='color: #4b4b4b;'>Tên tài khoản hoặc mật khẩu không chính xác</h3>\r\n"
								+ "    </div>");
						request.getRequestDispatcher("Login.jsp").forward(request, response);
					}
				}else {
					request.setAttribute("mes", "<div class='mes' style='width: 56.58%; height: 50px; background-color: rgb(250, 231, 207);margin-left: 65px; line-height: 50px;font-size: 12px;\r\n"
							+ "    text-align: center;'>\r\n"
							+ "        <h3 style='color: #4b4b4b;'>Vui lòng nhập đầy đủ thông tin</h3>\r\n"
							+ "    </div>");
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
				
//			}else if("Facebook".equals(btnRgt)) {
//				out.println("<h1> fb </h1>");
//				
//			}else if("Google".equals(btnRgt)){
//				out.println("<h1> gg </h1>");
//			}
			
		}

		
		
		
	}

}

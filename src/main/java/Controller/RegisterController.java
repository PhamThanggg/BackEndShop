package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DB.DBConnection;
import Model.Account;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet(name = "RegisterController", urlPatterns = "/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Connection conn = DBConnection.CreateConnection();
//		PrintWriter out = response.getWriter();
//		if(conn != null) {
//			try {
//				out.println("<h1> okok </h1>");
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}else {
//			out.println("<h1> not okok </h1>");
//			request.getRequestDispatcher("Register.jsp").forward(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		String gmail = request.getParameter("gmail");
		
		String btnRgt = request.getParameter("btn");
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
//			if("Register".equals(btnRgt)) {
				if(!uname.equals("") && !pass.equals("") && !repass.equals("") && !gmail.equals("")) {
					if(!pass.equals(repass)) {
						
						request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px; margin-left: 65px;font-size: 12px'>\r\n"
								+ "        <h3 style='color: #4b4b4b;'>Mật khẩu không trùng khớp</h3>\r\n"
								+ "    </div>");
						request.getRequestDispatcher("Register.jsp").forward(request, response);
					}else {
						Dao dao = new Dao();
						Account a = dao.CheckAccountExist(uname);
						if(a==null) {
							dao.Signup(uname, pass, gmail);
							request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px; margin-left: 65px;font-size: 12px'>\r\n"
									+ "        <h3 style='color: #4b4b4b;'>Đăng ký thành công</h3>\r\n"
									+ "    </div>");
							request.getRequestDispatcher("Register.jsp").forward(request, response);	
						}else {
							request.setAttribute("mes", "<div class='mes' style='width: 56.58%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px; margin-left: 65px;font-size: 12px'>\r\n"
									+ "        <h3 style='color: #4b4b4b;'>Tên đăng nhập đã tồn tại</h3>\r\n"
									+ "    </div>");
							request.getRequestDispatcher("Register.jsp").forward(request, response);
						}
					}
				}else {
					request.setAttribute("mes", "<div class='mes' style='width: 56.58%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px; margin-left: 65px;font-size: 12px'>\r\n"
							+ "        <h3 style='color: #4b4b4b;'>Vui lòng nhập đầy đủ thông tin</h3>\r\n"
							+ "    </div>");
					request.getRequestDispatcher("Register.jsp").forward(request, response);
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

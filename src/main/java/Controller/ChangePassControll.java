package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import Model.Account;

/**
 * Servlet implementation class ChangePassControll
 */
@WebServlet(urlPatterns = "/changepass")
public class ChangePassControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

        // Lấy dữ liệu từ session
        Account acc = (Account) session.getAttribute("acc");
        String uname = acc.getUser_name();
        //lay pass cua tk
        String passTk = acc.getPassword();
        int id = acc.getUser_id();
//        request.setAttribute("acc", acc);
        
        String passO = request.getParameter("uname");
        String passNew = request.getParameter("phone");
        String repass = request.getParameter("email");
        
        Dao dao = new Dao();
        if(passO != "" && passNew != "" && repass!="") {
        	if(passTk.equals(passO)) {
        		if(passNew.equals(repass)) {
        			dao.UpdatePass(passNew, id);
        	        
        	        // day lai session
        	        Account acc1 = dao.CheckAccountExist(uname);
        	        session.setAttribute("acc", acc1);
        	        
        	        request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
        					+ "        <h3 style='color: #4b4b4b;'>Thay doi mat khau thanh cong</h3>\r\n"
        					+ "    </div>");
        			request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
        		}else {
        			request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
        					+ "        <h3 style='color: #4b4b4b;'>Mat khau khong trung khop</h3>\r\n"
        					+ "    </div>");
        			request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
        		}
        	}else {
        		request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
    					+ "        <h3 style='color: #4b4b4b;'>Mat khau cu khong chinh xac</h3>\r\n"
    					+ "    </div>");
    			request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
        	}
        }else {
        	request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
					+ "        <h3 style='color: #4b4b4b;'>Vui long nha du thong tin</h3>\r\n"
					+ "    </div>");
			request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
        }
        
	}

}

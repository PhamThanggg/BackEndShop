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
 * Servlet implementation class EditAccControll
 */
@WebServlet(urlPatterns = "/editacc")
public class EditAccControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAccControll() {
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

        // Lấy dữ liệu từ session
        Account acc = (Account) session.getAttribute("acc");
        int id = acc.getUser_id();
        String name_acc = acc.getUser_name();
//        request.setAttribute("acc", acc);
        
        String uname = request.getParameter("uname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Dao dao = new Dao();
        
        if(uname!="" && phone!="" && email!="") {
        	if(uname.equals(name_acc)) {
                dao.UpdateAcc(uname, phone, email, id);
                
                // day lai session
                Account acc1 = dao.CheckAccountExist(uname);
                session.setAttribute("acc", acc1);
                
                request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
        				+ "        <h3 style='color: #4b4b4b;'>Thay doi thanh cong</h3>\r\n"
        				+ "    </div>");
        		request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        	}else {
        		if(dao.CheckAccountExist(uname) == null) {
        			dao.UpdateAcc(uname, phone, email, id);
                    
                    // day lai session
                    Account acc1 = dao.CheckAccountExist(uname);
                    session.setAttribute("acc", acc1);
                    
                    request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
            				+ "        <h3 style='color: #4b4b4b;'>Thay doi thanh cong</h3>\r\n"
            				+ "    </div>");
            		request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        		}else {
        			request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
            				+ "        <h3 style='color: #4b4b4b;'>Ten tai khoan da ton tai trong he thong</h3>\r\n"
            				+ "    </div>");
            		request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        		}
        	}
        }else {
        	request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
    				+ "        <h3 style='color: #4b4b4b;'>Vui long nhap day du thong tin</h3>\r\n"
    				+ "    </div>");
    		request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        }
        
        
	}

}

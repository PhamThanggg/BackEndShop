package Controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import Model.Account;

/**
 * Servlet implementation class SendMailControll
 */
@WebServlet(urlPatterns = "/sendmail")
public class SendMailControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailControll() {
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
		Dao dao = new Dao();
		String name_gm = request.getParameter("email");
		Account acc = dao.getEmailAccount(name_gm);
		
		if(acc != null) {
			String email_to = acc.getGmail();
			int acc_id = acc.getUser_id();
			 Random random = new Random();
		        // Sinh số nguyên ngẫu nhiên trong khoảng từ 1000 đến 10000
		    int randomNumber = random.nextInt(9001) + 1000;
			dao.UpdatePass(randomNumber, acc_id);
		    
			 String host = "smtp.gmail.com";
			  final String user = "phamthanglg2020@gmail.com";// change accordingly
			  final String password = "hvadqotifmfdkozv";// change accordingly
			  String to = email_to;// change accordingly
			  // Get the session object
			  Properties props = new Properties();
			  props.put("mail.smtp.host", host);
			  props.put("mail.smtp.auth", "true");
			  // props.put("mail.smtp.auth", "true");
			  props.put("mail.smtp.starttls.enable", "true");
			  props.put("mail.smtp.host", host);
			  props.put("mail.smtp.port", "587");
			  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(user, password);
			   }
			  });
			  // Compose the message
			  try {
			   MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			   
			   message.setSubject("Thong bao doi mai khau");
			   message.setText("Mat khau moi cua ban la: "+randomNumber);
			   // send the message
			   Transport.send(message);
//			   System.out.println("message sent successfully..."+randomNumber);
			   request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
						+ "        <h3 style='color: #4b4b4b;'>Vui long check gmail de xem mat khau moi</h3>\r\n"
						+ "    </div>");
				request.getRequestDispatcher("Forgot.jsp").forward(request, response);
			  } catch (MessagingException e) {
			   e.printStackTrace();
			  }
		}else {
			request.setAttribute("mes", "<div class='mes' style='width: 100%; height: 50px; background-color: rgb(250, 231, 207); text-align: center; line-height: 50px;'>\r\n"
					+ "        <h3 style='color: #4b4b4b;'>Email khong ton tai</h3>\r\n"
					+ "    </div>");
			request.getRequestDispatcher("Forgot.jsp").forward(request, response);
		}
		
		
	}

}

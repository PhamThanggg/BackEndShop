package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import DAO.CategoryDao;
import DAO.ProductDao;
import DAO.Time;
import Model.Account;
import Model.Category;

/**
 * Servlet implementation class AddProductController
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(urlPatterns = "/addnewproduct")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryDao dao = new CategoryDao();
		List<Category> list = dao.getCategory();

		request.setAttribute("listC", list);
		request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("txtname");
		String title = request.getParameter("txtdesc");
		String quantity = request.getParameter("txtquantity");
		String price = request.getParameter("txtprice");
		String cate = request.getParameter("txtcateid");
		String color = request.getParameter("txtcolor");
		String size = request.getParameter("txtsize");
		
		// Đảm bảo thư mục uploads tồn tại
        String uploadPath = request.getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        // Xử lý việc lưu trữ file
        Part filePart = request.getPart("file");
		
		if(!name.equals("") && !title.equals("") 
				&& !quantity.equals("") && !price.equals("") 
				&& !cate.equals("") && filePart != null && filePart.getSize() > 0 
				&& !color.equals("") && !size.equals("")) {
			// lưu filex`
			String fileName = getFileName(filePart);
			
			// Kiểm tra và tạo tên file mới nếu tên file đã tồn tại
	        File file = new File(uploadPath + File.separator + fileName);
	        int count = 1;
	        String baseName = fileName.substring(0, fileName.lastIndexOf('.'));
	        String extension = fileName.substring(fileName.lastIndexOf('.'));
	        while (file.exists()) {
	            fileName = baseName + "_" + count + extension;
	            file = new File(uploadPath + File.separator + fileName);
	            count++;
	        }
	        // lưu
	        String savePath = uploadPath + File.separator + fileName;
	        filePart.write(savePath);
	        
	        String img = "uploads/"+fileName;
	        
	        
	        Account acc = Time.getAcc(request);
	        int id_user = acc.getUser_id();
	        ProductDao dao = new ProductDao();
	        dao.addProduct(name, price, quantity, title, img, size, color, cate, id_user);
	        
	        request.setAttribute("mes", "Thêm thành công");
	        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
			
		}else {
			request.setAttribute("mes", "Vui lòng nhập đủ thông tin");
			request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
		}
	}
	
	private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}

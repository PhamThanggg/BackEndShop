package Controller;

import java.io.File;
import java.io.IOException;
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
import DAO.Dao;
import DAO.ProductDao;
import DAO.Time;
import Model.Account;
import Model.Category;
import Model.Product;

/**
 * Servlet implementation class UpdateProductController
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB

@WebServlet(urlPatterns = "/updateproduct")
public class UpdateProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("pid");
		HttpSession sesion = request.getSession();
		sesion.setAttribute("pid", id);
		CategoryDao daoC = new CategoryDao();
		List<Category> list = daoC.getCategory();

		
		Dao dao = new Dao();
		Product pro = dao.getProduct(id);
		
		request.setAttribute("listC", list);
		request.setAttribute("pro", pro);
		request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String pid = "";
		HttpSession sesion = request.getSession();
		if(request.getParameter("pid") != null) {
			pid = request.getParameter("pid");
		}else if(sesion.getAttribute("pid") != null) {
			pid =(String) sesion.getAttribute("pid");
			sesion.removeAttribute("pid");
		}
		
		String name = request.getParameter("txtname");
		String title = request.getParameter("txtdesc");
		String quantity = request.getParameter("txtquantity");
		String price = request.getParameter("txtprice");
		String cate = request.getParameter("txtcateid");
		String color = request.getParameter("txtcolor");
		String size = request.getParameter("txtsize");
		String status = request.getParameter("txtstatus");
		String imgDelete1 = request.getParameter("imggoc");
        int viTriCuoi = imgDelete1.lastIndexOf("/");
        String imgDelete = "";
        if (viTriCuoi != -1) {
            imgDelete = imgDelete1.substring(viTriCuoi + 1);
        } 
		String img = "";
		
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
				&& !cate.equals("") && !status.equals("")
				&& !color.equals("") && !size.equals("")
				&& !pid.equals("")
				) {
			
	        
	        if(filePart != null && filePart.getSize() > 0) {
	        	// lưu file ảnh mới
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
		        
		        img = "uploads/"+fileName;
		        // end lưu file ảnh mới
	        	
	        	// xóa ảnh cũ
	        	String fileNameDele = imgDelete; // Tên của tệp tin ảnh cần xóa
	        	String uploadPathDele = getServletContext().getRealPath("/uploads/"); // Lấy đường dẫn thực tế tới thư mục uploads
	        	
	        	File imageFile = new File(uploadPathDele + File.separator + fileNameDele);
	        	
	        	if (imageFile.exists()) {
	        		if (imageFile.delete()) {
	        			response.getWriter().println("Tệp tin ảnh đã được xóa thành công.");
	        		} else {
	        			response.getWriter().println("Không thể xóa tệp tin ảnh.");
	        		}
	        	} else {
	        		response.getWriter().println("Tệp tin ảnh không tồn tại.");
	        	}	      
	        	// end xóa ảnh cũ
	        }else {
	        	img = imgDelete1;
	        }
	        
	        
	        Account acc = Time.getAcc(request);
	        int id_user = acc.getUser_id();
	        ProductDao dao = new ProductDao();
	        dao.updateProduct(name,status, price, quantity, title, img, size, color, cate, pid);
	        
	        request.setAttribute("mes", "Cập nhật thành công");
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

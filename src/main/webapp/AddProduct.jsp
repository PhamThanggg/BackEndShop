<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="https://kit.fontawesome.com/9140a7c26d.js" crossorigin="anonymous"></script>
    
    <link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="vendor/simple-datatables/style.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
    <title>Add product</title>
</head>

<body>
	<jsp:include page="HeaderAdmin.jsp"></jsp:include>
	<jsp:include page="Sidebar.jsp"></jsp:include>
	<main id="main" class="main" style="margin-top: 0px;">
	<div style="height: 50px"></div>
    <div class="container form-text">
        <div class="row">
        	<a href="productmanagement">Trở lại</a>
            <div class="col-sm-12">
                <h1>Thêm Sản Phẩm</h1>
            </div>
            <div class="col-sm-12">
                <!-- Form Thêm sản phẩm -->
                <form method="post" enctype="multipart/form-data" action="addnewproduct">
                    <!-- Tên sản phẩm -->
                    <div class="form-group">
                        <label for="txtname">Tên sản phẩm</label>
                        <input class="form-control" id="txtname" type="text" name="txtname"
                            value="">
                    </div>
                    <!-- Mô tả sản phẩm -->
                    <div class="form-group">
                        <label for="txtdesc">Mô tả sản phẩm</label>
                        <textarea class="form-control" type="text" id="txtdesc" name="txtdesc" rows="3"
                            value=""></textarea>
                    </div>
                    <!-- Số lượng sản phẩm -->
                    <div class="form-group">
                        <label for="txtquantity">Số lượng sản phẩm</label>
                        <input class="form-control" type="number" id="txtquantity" name="txtquantity"
                            value="">
                    </div>
                    <!-- Giá sản phẩm -->
                    <div class="form-group">
                        <label for="txtprice">Giá sản phẩm</label>
                        <input class="form-control" type="number" id="txtprice" name="txtprice"
                            value="">
                    </div>
                    <!-- Loại sản phẩm -->
                    <div class="form-group">
                        <label>Loại sản phẩm</label>
                        <select class="form-control" name="txtcateid">
                            <option value="" selected>-- Chọn loại --</option>
                            
                        <c:forEach items="${listC}" var="o">
                            <option value="${o.cateId}">${o.name}</option>
						</c:forEach>

                        </select>
                    </div><!-- Loại sản phẩm -->
                    <div class="form-group">
                        <label for="txtpic">Url Hình ảnh</label>
                        <div class="custom-file">
                            <input type="file" id="txtpic" name="file" accept=".png,.gif,.jpg,.jpeg">
                            <!-- <label class="custom-file-label" for="txtpic">Chọn hình</label> -->
                        </div>
                    </div>
                    <label>Loại sản phẩm</label>
                    <select class="form-control" name="txtcolor">
                        <option value="" selected>-- Chọn màu --</option>

                        <option value="BLACK">BLACK</option>
                        <option value="WHILE">WHILE</option>

                    </select>
                    
                    <div class="form-group">
                        <label for="txtprice">Size sản phẩm(Nhập theo định dạng "10, 20, 10 ...")</label>
                        <input class="form-control" type="text" id="txtprice" name="txtsize"
                            value="">
                    </div>
                    <br>
                    
                    <button type="submit" class="btn btn-primary" name="btnsubmit">Thêm sản phẩm</button>
                    
                    <p style="color: blue;">${mes}</p>
                </form>
            </div>
        </div>
    </div>
    </main>
     <script src="js/main.js"></script>
</body>

</html>
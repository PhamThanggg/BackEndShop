<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/loginn.css">
  	  <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/themify-icons/themify-icons.css">
     <link rel="stylesheet" href="css/footer.css">
     <link rel="stylesheet" href="css/shop.css">
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div style="height: 50px"></div>
	<form action="login" method="post">
    <div class="container" >
        <div class="container-image">
            <img src="https://laforce.vn/wp-content/uploads/2023/04/giay-mac-nhat-the-gioi.jpg" alt="" class="ctn-image">
        </div>
	        <div class="ctn-right">
	            <h2 class="ctn-right-hed">Đăng nhập</h2>
	            ${mes}
	            <input type="text" name="uname" class="ctn-input-txt" placeholder="Tên đăng nhập"><br>
	            <input type="password" name="pass" class="ctn-input-txt" placeholder="Mật khẩu"><br>
	            <input type="submit" name="btn" value="Đăng nhập" class="ctn-input-lg"><br>
	            <input type="checkbox" class="ctn-input-cb"> <span style="font-size: 14px">Nhớ tên tài khoản</span><br>
	            <a href="Forgot.jsp" class="ctn-input-forgot">Quên mật khẩu</a><br>
	            <div class="btn-or">
	                <div class="btn-or-1"></div>
	                <span style="padding-left: 6px; color: #8a8a8a;">Hoặc</span>
	                <div class="btn-or-2"></div>
	            </div>
	            <input type="submit" name="btn" id="" value="Facebook" class="btn-fb">
	            <input type="submit" name="btn" id="" value="Google" class="btn-gg"><br>
	            <div style="margin-top: 20px;"></div>
	            <span class="ctn-input-rgs">Không có tài khoản? </span> <a href="Register.jsp" class="ctn-input-rps" >Đăng ký</a>
	        </div>
    </div>
    </form>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

<!-- breakpoints -->
<!-- Mobile width < 740px -->
<!-- Tablet width >= 740px <= 1024 -->
<!-- PC width >= 1024px -->
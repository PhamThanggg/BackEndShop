<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/themify-icons/themify-icons.css">
     <link rel="stylesheet" href="css/footerr.css">
     <link rel="stylesheet" href="css/shop.css">
    <title>Forgot</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
   <form action="sendmail" method="post">
   ${mes}
    <div class="card text-center" style="width: 300px; margin: 100px auto;">
        <div class="card-header h5 text-white bg-primary">
Đặt lại mật khẩu</div>
        <div class="card-body px-5">
            <p class="card-text py-2">
                Nhập địa chỉ email của bạn và chúng tôi sẽ gửi cho bạn một email kèm theo hướng dẫn để đặt lại mật khẩu của bạn.
            </p>
            <div class="form-outline">
                <input type="email" name="email" id="typeEmail" class="form-control my-3" />
                <label class="form-label" for="typeEmail">Nhập Email</label>
            </div>
            <input type="submit" name="sm" value="Nhận mã">
            <div class="d-flex justify-content-between mt-4">
                <a class="" href="Login.jsp">Đăng nhập</a>
                <a class="" href="Register.jsp">Đăng ký</a>
            </div>
        </div>
    </div>
   </form>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
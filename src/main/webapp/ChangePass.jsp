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
      <link
        href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900%7CJost:100,200,300,400,500,600,700,800,900"
        rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/header.css">
     <link rel="stylesheet" href="css/footerr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/themify-icons/themify-icons.css">
    <title>Change password</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div style="height: 100px"></div>
	${mes}
    <div class="container bootstrap snippets bootdey ">
        <h1 class="" style="color: black;">Thay đổi mật khẩu</h1>
          <hr>
        <div class="row">
          <!-- edit form column -->
          <div class="col-md-9 personal-info">
            <h3>Thay đổi mật khẩu</h3>
            
            <form action="changepass" class="form-horizontal" role="form" method="post"  >
              <div class="form-group">
                <label class="col-lg-3 control-label">Mât khẩu cũ:</label>
                <div class="col-lg-8">
                  <input class="form-control" type="password" name="uname" value="">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Mật khẩu mới:</label>
                <div class="col-lg-8">
                  <input class="form-control" type="password" name="phone" value="">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Nhập lại mật khẩu:</label>
                <div class="col-lg-8">
                  <input class="form-control" type="password" name="email" value="">
                </div>
              </div>
            <br>    
              <input type="submit" value="Thay đổi" name="" style="background: black; border: none; color: white; padding: 5px 20px;">
            </form>
          </div>
      </div>
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!doctype html>
<html lang="en">

<head>
	<title>Product man</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/productmgn.css">
	
		<link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="vendor/simple-datatables/style.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

</head>

<body>
<jsp:include page="HeaderAdmin.jsp"></jsp:include>
<jsp:include page="Sidebar.jsp"></jsp:include>
<main id="main" class="main" style="margin-top: -20px;">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section" style="margin: 5px 0;">Quản lý sản phẩm</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<a href="" style="margin-right: 20px;">Add category</a>
						<a href="addnewproduct">Add Product</a>
						<p style="margin: 0 0 0 20px"> ${mes }</p>
						<form action="" method="get">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th style="text-align: center;width: 40%;">Product</th>
									<th style="text-align: left; width: 12%;">Category</th>
									<th style="text-align: left; width: 8%;">Price</th>
									<th style="text-align: left; width: 8%;">Quantity</th>
									<th style="text-align: left; width: 8%;">Sell count</th>
									<th style="text-align: left; width: 10%;">Seller</th>
									<th style="text-align: left; width: 8%;">Detail</th>
									<th style="text-align: left; width: 10%;">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listP }" var="o">
								<tr class="alert" role="alert">
									<td style="display: flex;">
										<div class="img"
											style="background-image: url(${o.img});">
										</div>
										<div class="email" style="margin: 10px 0 0 20px;">
											<span>${o.name} </span>
											<span>${o.des }</span>
										</div>
									</td>
									<td>${o.nameCate }</td>
									<td>$${o.price }</td>
									<td class="quantity">
										<div class="input-group">
											<span>${o.quantity }</span>
										</div>
									</td>
									<td>${o.sell }</td>
									<td>${o.nameUser }</td>
									<td>
										<a href="updateproduct?pid=${o.id }" style="padding: 0 10px; font-size: 17px;">chi tiết</a>
									</td>
									<td><a href="deleteproduct?pid=${o.id}" class="close">
										<span aria-hidden="true"><i class="fa fa-close"></i></span>
									</a></td>
								</tr>
									</c:forEach>
							</tbody>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	</main>
	
	<!--  <script src="vendor/apexcharts/apexcharts.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="vendor/chart.js/chart.umd.js"></script>
 <script src="vendor/echarts/echarts.min.js"></script>
 <script src="vendor/quill/quill.min.js"></script>
 <script src="vendor/simple-datatables/simple-datatables.js"></script>
 <script src="vendor/tinymce/tinymce.min.js"></script>
 <script src="vendor/php-email-form/validate.js"></script> -->
	
 <!-- Template Main JS File -->
 <script src="js/main.js"></script>
</body>

</html>
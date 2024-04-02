<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/cartItem.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="css/shop.css">
<title>Cart</title>
</head>

<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<!-- Heading -->
	<div style="margin-top: 100px"></div>

	<div class="container">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-md-9">
					<div class="ibox" id="myDiv">
						<form action="cartItem" method="get">
							<div class="ibox-title"
								style="position: fixed; width: 820px; margin-top: -50px; background-color: white; z-index: 1;">
								<span class="pull-right">(<strong id="sl_item">${count}</strong>)
									items
								</span>
								<h5>Items in your cart</h5>
							</div>

							<div style="margin-top: 50px;"></div>
							<c:choose>
								<c:when test="${count == 0}">
									<p
										style="font-size: 30px; margin: 0px 0 0 280px; padding-bottom: 90px">Giỏ
										hàng trống</p>
								</c:when>
								<c:otherwise>
									<input type="checkbox" id="mainCheckbox"
										style="margin-left: 18px; width: 18px; height: 20px; margin-top: 10px;">
									<span style="position: absolute; margin: 7px 0 0px 10px;">Tất
										cả</span>
								</c:otherwise>
							</c:choose>

							<c:forEach items="${listC}" var="o">
								<div class="ibox-content">
									<div class="table-responsive">
										<table class="table shoping-cart-table"
											style="position: relative;">
											<tbody>
												<tr>
													<td width="90"><img src="${o.img}" alt=""
														style="width: 90px;"> <input type="checkbox"
														value="${o.cartId}" name="checkbox" class="subCheckbox"
														data-price="${o.price}"
														style="margin-left: 35px; margin-top: 20px; width: 18px; height: 20px;">
													</td>
													<td class="desc">
														<h3>
															<a href="#" class="text-navy">${o.name} </a>
														</h3>
														<p class="small">${o.des}</p>

														<div class="m-t-sm">
															<!-- <a href="#" class="text-muted"><i class="fa fa-gift"></i> Add gift
                                                        package</a> -->
															<a href="delete?pid=${o.cartId}" class="text-muted"><i
																class="fa fa-trash"></i> Remove item</a>
														</div>
													</td>

													<td>$${o.price_one} <s class="small text-muted"> <!-- $230,00</s>--></td>
													<td width="65"><input type="text"
														value="${o.quantity}"
														style="padding-left: 10px; line-height: 40px; height: 40px; width: 100%; border-radius: unset; background: #f4f4f4; border: 0; outline: none;"></td>
													<td>
														<h4>$${o.price}</h4>
													</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</c:forEach>
						</form>
						
						
						<div class="ibox-content" id="fixedElement"
							style="position: fixed; width: 820px; top: 680px;">
							<button class="btn btn-primary pull-right"
								onclick="getCheckboxValues()">
								<i class="fa fa fa-shopping-cart"></i> Checkout
							</button>
							<!-- <button class="btn btn-white">
								<i class="fa fa-arrow-left"></i> Continue shopping
							</button> -->

						</div>
						</div>
						
				</div>
				<div class="col-md-3" style="position: fixed; left: 1010px;">
					<div class="ibox">
						<div class="ibox-title">
							<h5>Cart Summary</h5>
						</div>
						<div class="ibox-content">
							<span> Total </span>
							<h2 class="font-bold" id="totalPrice">Tổng giá tiền: $0</h2>

							<hr>
							<span class="text-muted small"> *For United States, France
								and Germany applicable sales tax will be applied </span>
							<div class="m-t-sm">
								<div class="btn-group">
									<!-- <a href="#" class="btn btn-primary btn-sm"><i
										class="fa fa-shopping-cart"></i> Checkout</a> <a href="#"
										class="btn btn-white btn-sm"> Cancel</a> -->
									<button class="btn btn-primary pull-right btn-sm"
										onclick="getCheckboxValues()">
										<i class="fa fa fa-shopping-cart"></i> Checkout
									</button>
								</div>
									<p style="color: red; font-size: 25px;" class="text-err"></p>
									<p style="color: red; font-size: 25px;" class="text-err">${mess}</p>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

	<script>
		// Lấy phần tử cần cố định
		var fixedElement = document.getElementById("fixedElement");
		var sl_item1 = document.getElementById("sl_item").innerText;
		var sl_item = parseInt(sl_item1) - 2;
		//console.log(sl_item)

		// Lấy phần tử div
		var myDiv = document.getElementById("myDiv");

		// Lấy độ dài (chiều cao) của phần tử div
		var height = myDiv.offsetHeight - 550;
		//console.log(height);

		// Bắt sự kiện cuộn trang
		window.addEventListener("scroll", function() {
			// Kiểm tra vị trí y hiện tại của cửa sổ
			var scrollY = window.scrollY || window.pageYOffset;

			// Nếu vị trí y hiện tại của cửa sổ lớn hơn vị trí y ban đầu của phần tử cố định
			if (scrollY > height) {
				// Gỡ bỏ thuộc tính CSS 'position: fixed;'
				fixedElement.style.position = "static";
			} else {
				// Nếu không, giữ nguyên thuộc tính 'position: fixed;'
				fixedElement.style.position = "fixed";
			}
		});

		// check box
		document.getElementById("mainCheckbox").addEventListener(
				"change",
				function() {
					var checkboxes = document
							.getElementsByClassName("subCheckbox");
					for (var i = 0; i < checkboxes.length; i++) {
						checkboxes[i].checked = this.checked;
					}
				});

		// tong tien
		document.getElementById("mainCheckbox").addEventListener(
				"change",
				function() {
					var checkboxes = document
							.getElementsByClassName("subCheckbox");
					for (var i = 0; i < checkboxes.length; i++) {
						checkboxes[i].checked = this.checked;
					}
					updateTotalPrice();
				});

		var subCheckboxes = document.getElementsByClassName("subCheckbox");
		for (var i = 0; i < subCheckboxes.length; i++) {
			subCheckboxes[i].addEventListener("change", function() {
				updateTotalPrice();
			});
		}

		function updateTotalPrice() {
			var checkboxes = document.getElementsByClassName("subCheckbox");
			var totalPrice = 0;
			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					totalPrice += parseFloat(checkboxes[i]
							.getAttribute("data-price"));
				}
			}
			document.getElementById("totalPrice").innerText = "Tổng giá tiền: $"
					+ totalPrice;
		}

		// chon phan tu khi an nut mua ngay
		document
				.addEventListener('DOMContentLoaded',
						function() {
							var urlParams = new URLSearchParams(
									window.location.search);
							var paramName = urlParams.get('pid'); // Thay 'name' bằng tên tham số bạn muốn so sánh

							if (paramName !== null) {
								var checkboxes = document
										.getElementsByClassName('subCheckbox');
								//console.log(checkboxes[0].value)
								//for (var i = 0; i < checkboxes.length; i++) {
								//  if (checkboxes[i].value === paramName) {
								checkboxes[0].checked = true;
								updateTotalPrice()
								//}
								//}
							}
						});

		// lấy ra các value của checkbox đc checked
		function getCheckboxValues() {
			var checkboxes = document
					.querySelectorAll('input[name=checkbox]:checked');
			if(checkboxes.length > 0){
				var values = "";
				var dem = 0;
				checkboxes.forEach(function(checkbox) {
					dem++;
					values += checkbox.value;
					if(checkboxes.length-1 >= dem){
						values += "-";
					}
				});
				var urlWithParams = 'checkout' + '?data=' + values;

				// Chuyển hướng đến URL mới
				window.location.href = urlWithParams;
			}else{
				
				var errorElements = document.querySelectorAll('.text-err');
				errorElements.forEach(function(element) {
			        element.textContent = 'Không có gì để thanh toán';
			    });
			}
		}
	</script>
</body>

</html>
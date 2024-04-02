<%@page import="DAO.Dao"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900%7CJost:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" media="all">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/grid.css">
<link rel="stylesheet" href="css/shop.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/themify-icons/themify-icons.css">
<title>Shop</title>
</head>

<body>
	<div id="shop">

		<jsp:include page="Header.jsp"></jsp:include>

<form action="shop" method="get">
		<div class="shop__body">
			<div class="shop__body-slider">
				<img width="100%"
					src="https://priazo-store-demo.myshopify.com/cdn/shop/files/collection.jpg?v=1654223080"
					alt="slider">
				<div class="shop__body-slider-link">
					<h3>Products</h3>
					<p>
						<a href=""> Home <i class="ti-angle-right"></i>
						</a> Product
					</p>
				</div>
			</div>

			<div class="grid shop__body-box">
				<div class="row shop__body-product-row shop__body-product">
					<div class="col m-6 pc-8 t-8">
						<button type="button" class="shop__body-product-btn">
							<i class="ti-filter"></i> Filter
						</button>
					</div>
					<div class="col m-6 pc-4 t-4">
						<div class="row shop__body-product-row">
							<div class="col shop__body-product-list">
								<i class="ti-layout-grid2-alt"></i>
								<div class="shop__body-product-item">
									<div class="row shop__body-product-item-wrap">
										<div class="col">
											<a class="shop__body-product-icon" href="">1</a>
										</div>
										<div class="col">
											<a class="shop__body-product-icon" href="">2</a>
										</div>
										<div class="col">
											<a class="shop__body-product-icon" href="">3</a>
										</div>
										<div class="col">
											<a class="shop__body-product-icon" href="">4</a>
										</div>
										<div class="col">
											<a class="shop__body-product-icon" href="">5</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<select class="shop__body-product-select" name="" id="">
									<option class="shop__body-product-option" value="">Default
										sorting</option>
									<option class="shop__body-product-option" value="">Best
										selling</option>
									<option class="shop__body-product-option" value="">Alphabetically,
										A-Z</option>
									<option class="shop__body-product-option" value="">Price,
										high to low</option>
									<option class="shop__body-product-option" value="">Price,
										low to high</option>
									<option class="shop__body-product-option" value="">Date,
										old to new</option>
									<option class="shop__body-product-option" value="">Date,
										new to old</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row shop__body-product">
					<div
						class="col pc-3 t-0 m-0 shop__body-product-slider shop__body-product-btn-hide">
						<div class="row">
							<div class="col pc-12 t-0 m-0">
								<div class="shop__body-product-category">
									<h2 class="shop__body-product-category-title">categories</h2>
									<ul class="shop__body-product-list-category">
										<li><a href="home">Home</a></li>
										<li><a href="shop">Shop</a></li>
										<li><a href="#">Pages</a></li>
										<li><a href="#">Blogs</a></li>
										<li><a href="#">Contact</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col pc-12 t-0 m-0">
								<div class="shop__body-product-category">
									<h2 class="shop__body-product-category-title">Price</h2>
									<ul class="shop__body-product-list-category">
										<li class="shop__body-product-list-category-checkbox"><input
											type="radio" name="" id="myCheckbox" value="10-100" >$10 - $100</li>
										<li class="shop__body-product-list-category-checkbox"><input
											type="radio" name="" id="myCheckbox1" value="100-500">$100 - $500</li>
										<li class="shop__body-product-list-category-checkbox"><input
											type="radio" name="" id="myCheckbox2" value="500-1000" >$500 - $1000</li>
										<li class="shop__body-product-list-category-checkbox"><input
											type="radio" name="" id="myCheckbox3" value="1000-10000" >$1000 - $10000</li>
										<li class="shop__body-product-list-category-checkbox"><input
											type="radio" name="" id="myCheckbox4" value="1000" > > $1000</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- <div class="row">
							<div class="col pc-12 t-0 m-0">
								<div class="shop__body-product-category">
									<h2 class="shop__body-product-category-title">Size</h2>
									<ul
										class="shop__body-product-list-category shop__body-product-list-category-size">
										<li><a href="">S</a></li>
										<li><a href="">M</a></li>
										<li><a href="">L</a></li>
										<li><a href="">XL</a></li>
										<li><a href="">XXL</a></li>
									</ul>
								</div>
							</div>
						</div> -->
						<div class="row">
							<div class="col pc-12 t-0 m-0">
								<div class="shop__body-product-category">
									<h2 class="shop__body-product-category-title">Tags</h2>
									<ul
										class="shop__body-product-list-category shop__body-product-list-category-size">
										<li><a href="">Black</a></li>
										<li><a href="">Blue</a></li>
										<li><a href="">Orange</a></li>
										<li><a href="">Red</a></li>
										<li><a href="">White</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col pc-12 t-0 m-0">
								<div class="shop__body-product-category">
									<h2 class="shop__body-product-category-title">Brand</h2>
									<ul class="shop__body-product-list-category">
										<li><a href="">Priazo - Clothing & Fashion Responsive
												Shopify Theme</a></li>
										<li><img width="100%"
											src="https://priazo-store-demo.myshopify.com/cdn/shop/files/shopify-banner-sidebar.jpg?v=1654222645"
											alt=""></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col pc-12 t-12 m-12 shop__body-product-box">

						<div class="row">
							<c:forEach items="${listP}" var="o">
								<div class="col pc-3 t-4 m-6">
									<div class="shop__body-product-info">
										<a href="detail?pid=${o.id}"
											class="shop__body-product-infoImage"> <img width="100%"
											class="shop__body-product-info-img" src="${o.img}" alt="">
											<img width="100%"
											class="shop__body-product-info-img shop__body-product-hover-image"
											src="${o.img}" alt="">
										</a>

										<h4>
											<a href="#">${o.name}</a>
										</h4>
										<span style="">Đã bán ${o.sell} sản phẩm</span>
										<p>$${o.price}</p>
										<!-- <ul class="shop__body-product-info-click">
                                                    <li><a title="Add to cart" href=""><i
                                                                class="ti-shopping-cart"></i></a>
                                                    </li>
                                                    <li><a title="View product" href=""><i class="ti-eye"></i></a></li>
                                                    <li><a title="Add to wishlist" href=""><i class="ti-heart"></i></a>
                                                    </li>
                                                </ul> -->
									</div>
								</div>
							</c:forEach>
						</div>
						
						

						<!--  -->
							
						<div class="row shop__body-product-padding shop__body-product-page">	
							<a class="shop__body-product-page-link ${index==1?"disabled-btn":""} " href=""><i
								class="ti-angle-left"></i></a>
							<c:forEach begin="1" end="${soPage}" var="i">
								<a class="shop__body-product-page-link ${index==i?"active1":""} " href="shop?index=${i}">${i}</a>
							</c:forEach>
								<a class="shop__body-product-page-link ${soPage==index?"disabled-btn":""} " href=""><i
								class="ti-angle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
</form>
			<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="js/main.js"></script>
<script type="text/javascript">

//Lấy tất cả các nút radio trong nhóm
var radioButtons = document.querySelectorAll('input[type="radio"]');
console.log(radioButtons);
// Thêm sự kiện "change" để lắng nghe khi nút radio thay đổi trạng thái
radioButtons.forEach(function(button) {
    button.addEventListener('change', function() {
        // Nếu nút radio hiện tại được chọn, hãy loại bỏ tích của tất cả các nút radio khác trong nhóm
        if (this.checked) {
            radioButtons.forEach(function(btn) {
                if (btn !== button) {
                    btn.checked = false;
                }
            });
            console.log(this);
    	    var checkboxValue = this.value;
    	    console.log(checkboxValue);
    	    window.location.href = "shop?price=" + checkboxValue;
        }
        
    });
});
	
	
	
</script>
</html>
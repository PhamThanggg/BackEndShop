<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--  <link
        href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900%7CJost:100,200,300,400,500,600,700,800,900"
        rel="stylesheet" media="all"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/header.css">
     <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Home</title>
    <style>

    </style>
</head>

<body>
	<!--bg header  -->
	<jsp:include page="Header.jsp"></jsp:include>
	<!--end header  -->
	<form action="home" method="get">
    <div class="wrap" style="margin-top: 100px">
        <div class="containers">
            <div class="container_box">
                <img src="https://i.pinimg.com/originals/6b/bd/aa/6bbdaae591362e37df2de3baea843133.jpg" alt=""
                    class="container_box-img">
                <div class="container_box-info">
                    <h3>Basic</h3>
                    <a href="Shop.jsp">Xem thêm</a>
                </div>
            </div>
            <div class="container_box">
                <img src="https://i.pinimg.com/736x/04/ce/75/04ce75874d7775449ca6101c91e3112a.jpg" alt=""
                    class="container_box-img">
                <div class="container_box-info2">
                    <h3>Man</h3>
                    <a href="Shop.jsp">Xem thêm</a>
                </div>
            </div>
            <div class="container_box">
                <img src="https://www.emg.com.vn/wp-content/uploads/2022/01/nike.jpg" alt="" class="container_box-img">
                <div class="container_box-info3">
                    <h3>Women</h3>
                    <a href="Shop.jsp">Xem thêm</a>
                </div>
            </div>
        </div>

        <!-- Begin Slide -->
        <div class="hotdeal">
            <div class="container3">
                <div class="heading2">
                    <h3>HÀNG MỚI</h3>
                </div>
            </div>
        </div>
        <div class="container">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"
                        style="border: solid 1px rgb(155, 155, 155)"></li>
                    <li data-target="#myCarousel" data-slide-to="1" style="border: solid 0.5px rgb(155, 155, 155);">
                    </li>
                    <li data-target="#myCarousel" data-slide-to="2" style="border: solid 0.5px rgb(155, 155, 155);">
                    </li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" style="background-color: #f9f9f9;">
                    <div class="item active">
                    
                        <!-- Begin load New product -->
                        <div class="grid shop__body-box">
                            <div class="row shop__body-product">

                                <div class="col pc-12 t-12 m-12 shop__body-product-box">
                                    <div class="row">
                        				<c:forEach items="${listNewP1}" var="o">
                                        <div class="col pc-3 t-4 m-6">
                                            <div class="shop__body-product-info">
                                                <a href="detail?pid=${o.id}" class="shop__body-product-infoImage">
                                                    <img width="100%" class="shop__body-product-info-img"
                                                        src="${o.img}"
                                                        alt="">
                                                    <img width="100%"
                                                        class="shop__body-product-info-img shop__body-product-hover-image"
                                                        src="${o.img}"
                                                        alt="">
                                                </a>

                                                <h4><a href="#">${o.name}</a></h4>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end new product  -->

                    <!-- Begin load new product -->
                    <div class="item ">
                        <!-- Begin load product -->
                        <div class="grid shop__body-box">
                            <div class="row shop__body-product">

                                <div class="col pc-12 t-12 m-12 shop__body-product-box">
                                    <div class="row">
                                    	<c:forEach items="${listNewP2}" var="o">
                                        <div class="col pc-3 t-4 m-6">
                                            <div class="shop__body-product-info">
                                                <a href="detail?pid=${o.id}" class="shop__body-product-infoImage">
                                                    <img width="100%" class="shop__body-product-info-img"
                                                        src="${o.img}"
                                                        alt="">
                                                    <img width="100%"
                                                        class="shop__body-product-info-img shop__body-product-hover-image"
                                                        src="${o.img}"
                                                        alt="">
                                                </a>
                                                <h4><a href="#">${o.name}</a></h4>
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

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Begin load product -->
                    <div class="item ">
                        <!-- Begin load product -->
                        <div class="grid shop__body-box">
                            <div class="row shop__body-product">

                                <div class="col pc-12 t-12 m-12 shop__body-product-box">
                                    <div class="row">
                                    	<c:forEach items="${listNewP3}" var="o">
                                        <div class="col pc-3 t-4 m-6">
                                            <div class="shop__body-product-info">
                                                <a href="detail?pid=${o.id}" class="shop__body-product-infoImage">
                                                    <img width="100%" class="shop__body-product-info-img"
                                                        src="${o.img}"
                                                        alt="">
                                                    <img width="100%"
                                                        class="shop__body-product-info-img shop__body-product-hover-image"
                                                        src="${o.img}"
                                                        alt="">
                                                </a>
                                                <h4><a href="#">${o.name}</a></h4>
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

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end load new product -->
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" style="background-color: #f9f9f9;width: 0px; margin-left: 20px;"
                    href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" style="background-color: #f9f9f9;width: 0px; margin-right: 20px;"
                    href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <!-- End Slide -->

    </div>

    <div class="hotdeal">
        <div class="container3">
            <div class="heading2">
                <h3>ƯU ĐÃI ĐẶC BIỆT</h3>
                <span class="sub_heading">Đừng bỏ lỡ các ưu đãi nổi bật hôm nay</span>
            </div>
        </div>
    </div>

    <!-- Begin load product -->
    <div class="grid shop__body-box">
        <div class="row shop__body-product">

            <div class="col pc-12 t-12 m-12 shop__body-product-box">
                <div class="row">
                	<c:forEach items="${listHot}" var="o">
                    <div class="col pc-3 t-4 m-6">
                        <div class="shop__body-product-info">
                            <a href="detail?pid=${o.id}" class="shop__body-product-infoImage">
                                <img width="100%" class="shop__body-product-info-img"
                                    src="${o.img}"
                                    alt="">
                                <img width="100%" class="shop__body-product-info-img shop__body-product-hover-image"
                                    src="${o.img}"
                                    alt="">
                            </a>

                            <h4><a href="#">${o.name}</a></h4>
                             <span style="">Đã bán ${o.sell} sản phẩm</span>
                            <p>$${o.price}</p>
                            <!-- <ul class="shop__body-product-info-click">
                                <li><a title="Add to cart" href=""><i class="ti-shopping-cart"></i></a></li>
                                <li><a title="View product" href=""><i class="ti-eye"></i></a></li>
                                <li><a title="Add to wishlist" href=""><i class="ti-heart"></i></a></li>
                            </ul> -->
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <!--  -->

            </div>
        </div>
    </div>
    <!-- Begin load product -->

    <div class="ctn_board">
        <div class="billboard1">
            <div class="box_img1">
                <img src="https://kingshoes.vn/data/upload/media/giay-sneaker-chinh-hang-tphcm-tai-king-shoes-album-bo-suu-tap(1).jpg"
                    alt="">
            </div>
            <div class="box_content1">
                <div class="content1">
                    <h3>Chọn giày phù hợp với dáng người</h3>
                    <p>Tôn lên vẻ ngoài của người mặc. Tất cả các màu sắc, họa tiết, kiểu dáng, chất liệu,...</p>
                    <button><a href="Shop.jsp">MUA NGAY</a></button>
                </div>
            </div>
        </div>
        <div class="billboard2">
            <div class="box_content2">
                <div class="content2">
                    <h3>Chọn giày phù hợp với dáng người</h3>
                    <p>Tôn lên vẻ ngoài của người mặc. Tất cả các màu sắc, họa tiết, kiểu dáng, chất liệu,...</p>
                    <button><a href="Shop.jsp">MUA NGAY</a></button>
                </div>
            </div>
            <div class="box_img2">
                <img src="https://i.pinimg.com/originals/47/67/b8/4767b82fe7c0743c05a19a77e592550c.jpg" alt="">
            </div>
        </div>
    </div>

    <!-- bg best seller -->
    <div class="bestseller">
        <div class="container4">
            <div class="heading2">
                <h3>BÁN CHẠY</h3>
                <span class="sub_heading">Sản phẩm bán chạy nhất tuần này!</span>
            </div>
        </div>
    </div>

    <!-- Begin load product -->
    <div class="grid shop__body-box">
        <div class="row shop__body-product">

            <div class="col pc-12 t-12 m-12 shop__body-product-box">
                <div class="row">
                	<c:forEach items="${listDiscount}" var="c">
                    <div class="col pc-3 t-4 m-6">
                        <div class="shop__body-product-info">
                            <a href="detail?pid=${c.id}" class="shop__body-product-infoImage">
                                <img width="100%" class="shop__body-product-info-img"
                                    src="${c.img}"
                                    alt="">
                                <img width="100%" class="shop__body-product-info-img shop__body-product-hover-image"
                                    src="${c.img}"
                                    alt="">
                            </a>

                            <h4><a href="#">${c.name}</a></h4>
                             <span style="">Đã bán ${c.sell} sản phẩm</span>
                            <p>$${c.price}</p>
                            <!-- <ul class="shop__body-product-info-click">
                                <li><a title="Add to cart" href=""><i class="ti-shopping-cart"></i></a></li>
                                <li><a title="View product" href=""><i class="ti-eye"></i></a></li>
                                <li><a title="Add to wishlist" href=""><i class="ti-heart"></i></a></li>
                            </ul> -->
                        </div>
                    </div>
					</c:forEach>
                </div>

                <!--  -->

            </div>
        </div>
    </div>
    <!-- End load product -->

    <!-- End best seller -->
</form>
	
	<jsp:include page="footer.jsp"></jsp:include>

    <Script>
        var kichThuoc = document.getElementsByClassName("slide")[0].clientWidth;
        var chuyenSlide = document.getElementsByClassName("chuyen_slide")[0];
        var Img = chuyenSlide.getElementsByClassName("anh");
        var maxChuyen = kichThuoc * (Img.length / 3);
        maxChuyen -= kichThuoc;
        var Chuyen = 0;
        function Next() {
            if (Chuyen < maxChuyen) {
                Chuyen = Chuyen + kichThuoc;
            }
            else {
                Chuyen = 0;
            }
            chuyenSlide.style.marginLeft = "-" + Chuyen + "px";
        }
        function Back() {
            if (Chuyen == 0) {
                Chuyen = maxChuyen;
            }
            else {
                Chuyen = Chuyen - kichThuoc;
            }
            chuyenSlide.style.marginLeft = "-" + Chuyen + "px";
        }
        setInterval(function () {
            Next();
        }, 3000);
    </Script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/detailProduct1.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    
	<link rel="stylesheet" href="css/header.css">
     <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/themify-icons/themify-icons.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
     <link rel="stylesheet" href="css/shop.css">
    <title>Detail Product</title>
</head>

<body>
    <header>
		<jsp:include page="Header.jsp"></jsp:include>
        <!-- Heading -->
        <div style="margin-top: 100px"></div>
        <div class="" >
            <div class="container">
                <!-- Breadcrumb -->
                <nav class="d-flex">
                    <h6 class="mb-0">
                        <a href="" class="text-black-50">Home</a>
                        <span class="text-black-50 mx-2"> > </span>
                        <a href="" class="text-black"><u>Data</u></a>
                    </h6>
                </nav>
                <!-- Breadcrumb -->
            </div>
        </div>
        <!-- Heading -->
    </header>

    <!-- content -->
  
    <section class="py-4">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6">
                	 
                    <div class="border rounded-4 mb-3 d-flex justify-content-center">
                        
                            <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit"
                                src="${product.img}" />
                        </a>
                    </div>
                    <div class="d-flex justify-content-center mb-3">
                        
                            <img width="60" height="60" class="rounded-2"
                                src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big1.webp" />
                       
                        
                            <img width="60" height="60" class="rounded-2"
                                src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big2.webp" />
                    </div>
                    <!-- thumbs-wrap.// -->
                    <!-- gallery-wrap .end// -->
                </aside>
                <main class="col-lg-6">
                    <div class="ps-lg-3">
                        <h4 class="title text-dark">
                            ${product.name}
                        </h4>
                        <div class="d-flex flex-row my-3">
                            <div class="text-warning mb-1 me-2">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span class="ms-1">
                                    4.5
                                </span>
                            </div>
                            <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>${product.quantity} đã bán</span>
                            <span class="text-success ms-2">In stock</span>
                        </div>

                        <div class="mb-3">
                            <span class="h5">$${product.price}</span>
                            <span class="text-muted">/per box</span>
                        </div>

                        <p>
                            ${product.des}
                        </p>

                        <div class="row">
                            <dt class="col-3">Type:</dt>
                            <dd class="col-9">Phổ biến</dd>

                            <dt class="col-3">Màu</dt>
                            <dd class="col-9">${product.color}</dd>
<!-- 
                            <dt class="col-3">Material</dt>
                            <dd class="col-9">Cotton, Jeans</dd> -->

                            <dt class="col-3">Thương hiệu</dt>
                            <dd class="col-9">HuyThang</dd>
                        </div>
                        <hr />
                        <form action="detail" method="post">
                        <div class="row mb-4">
                            <div class="col-md-4 col-6">
                                <label class="mb-2">Size</label>
                                <select name = "sizeProduct" class="form-select border border-secondary" style="height: 35px;" >
                                <c:forEach items="${listSize}" var="o">
                                    <option>${o}</option>
                                </c:forEach>
                                </select>
                            </div>
						
                            <!-- col.// -->
                            <div class="col-md-4 col-6 mb-3" style="margin:0 0 0 40px">
                                <label class="mb-2 d-block">Số lượng</label>
                                <div class="input-group mb-3" style="width: 170px;">
                                    <button class="btn btn-white border border-secondary px-3" type="button"
                                        id="button-addon1" data-mdb-ripple-color="dark" onclick="decrement()">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                   
                                    <input type="number" value="1" min="1" id="myInput" name="slProduct" class="form-control text-center border border-secondary hide-spin-buttons"
                                        />
                                    <button class="btn btn-white border border-secondary px-3" type="button"
                                        id="button-addon2" data-mdb-ripple-color="dark" onclick="increment()">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <input type="submit" value="Mua ngay" name="btn" class="btn btn-warning shadow-0">
                        <!-- <a href="buynow" class="btn btn-warning shadow-0"> Mua ngay </a> -->
                        <input type="submit" value="Thêm vào giỏ hàng" name="btn" class="btn btn-primary shadow-0">
                        <!-- <i class="me-1 fa fa-shopping-basket"></i> -->
                        <div style="margin:20px 0 0 -60px">${mes}</div>
                       </form>
                       
                    </div>
                    
                </main>
            </div>
        </div>
    </section>
    <!-- content -->


    <section class="bg-light border-top py-4">
        <div class="container">
            <div class="row gx-4">
                <div class="col-lg-8 mb-4">
                    <div class="border rounded-2 px-3 py-2 bg-white">
                        <section style="background-color: #f7f6f6;">
                            <div class="container my-5 py-5 text-dark">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-12 col-lg-10 col-xl-8">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h4 class="text-dark mb-0">Đánh giá (4)</h4>
                                        </div>

                                        <div class="card mb-3">
                                            <div class="card-body">
                                                <div class="d-flex flex-start">
                                                    <img class="rounded-circle shadow-1-strong me-3"
                                                        src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(26).webp"
                                                        alt="avatar" width="40" height="40" />
                                                    <div class="w-100">
                                                        <div
                                                            class="d-flex justify-content-between align-items-center mb-3">
                                                            <h6 class="text-primary fw-bold mb-0">
                                                                lara_stewart
                                                                <span class="text-dark ms-2">Hmm, This poster looks
                                                                    cool</span>
                                                            </h6>
                                                            <p class="mb-0">2 days ago</p>
                                                        </div>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <p class="small mb-0" style="color: #aaa;">
                                                                <a href="#!" class="link-grey">Remove</a> •
                                                                <a href="#!" class="link-grey">Reply</a> •
                                                                <a href="#!" class="link-grey">Translate</a>
                                                            </p>
                                                            <div class="d-flex flex-row">
                                                                <i class="fas fa-star text-warning me-2"></i>
                                                                <i class="far fa-check-circle" style="color: #aaa;"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>


                        <!-- Pills content -->
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="px-0 border rounded-2 shadow-0">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Similar items</h5>
                                <div class="d-flex mb-3">
                                    <a href="#" class="me-3">
                                        <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/8.webp"
                                            style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                    </a>
                                    <div class="info">
                                        <a href="#" class="nav-link mb-1">
                                            Rucksack Backpack Large <br />
                                            Line Mounts
                                        </a>
                                        <strong class="text-dark"> $38.90</strong>
                                    </div>
                                </div>

                                <div class="d-flex mb-3">
                                    <a href="#" class="me-3">
                                        <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp"
                                            style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                    </a>
                                    <div class="info">
                                        <a href="#" class="nav-link mb-1">
                                            Summer New Men's Denim <br />
                                            Jeans Shorts
                                        </a>
                                        <strong class="text-dark"> $29.50</strong>
                                    </div>
                                </div>

                                <div class="d-flex mb-3">
                                    <a href="#" class="me-3">
                                        <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp"
                                            style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                    </a>
                                    <div class="info">
                                        <a href="#" class="nav-link mb-1"> T-shirts with multiple colors, for men and
                                            lady </a>
                                        <strong class="text-dark"> $120.00</strong>
                                    </div>
                                </div>

                                <div class="d-flex">
                                    <a href="#" class="me-3">
                                        <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/11.webp"
                                            style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                    </a>
                                    <div class="info">
                                        <a href="#" class="nav-link mb-1"> Blazer Suit Dress Jacket for Men, Blue color
                                        </a>
                                        <strong class="text-dark"> $339.90</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">  
    // cong tru input
function increment() {
    var input = document.getElementById("myInput");
    input.value = parseInt(input.value) + 1;
}

function decrement() {
    var input = document.getElementById("myInput");
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
    }
}

document.addEventListener("DOMContentLoaded", function() {
    var input = document.getElementById("myInput");
    input.addEventListener("input", function() {
        if (input.value < 1) {
            input.value = 1;
        }
    });
});


</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>List Product</title>
</head>

<style>
   @media (max-width: 767.98px) { .border-sm-start-none { border-left: none !important; } }
</style>


<body>
    <section style="background-color: #eee;">
        <div class="container py-5">

            <div class="search-container">
              <button class="btn btn-primary btn-sm" style="margin: 0 0 3px 115px;"> Thêm sản phẩm</button>
              <input type="text" placeholder="Search.." name="search" style="margin-left: 700px;">
              <button type="submit" style="margin: 0 0 0 -3px;"><i class="fa fa-search"></i></button>
          </div>  
          <div class="row justify-content-center mb-3">
            <div class="col-md-12 col-xl-10">
              <div class="card shadow-0 border rounded-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                      <div class="bg-image hover-zoom ripple rounded ripple-surface">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/img%20(4).webp"
                          class="w-100" />
                        <a href="#!">
                          <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-6">
                      <h5>Quant trident shirts</h5>
                      <span>Số lượng: 310</span>
                      <div class="d-flex flex-row">
                        <div class="text-warning mb-1 me-2">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <span>310</span>
                      </div>
                      <div class="mt-1 mb-0 text-muted ">
                        <span style="">Đã bán: 100</span>
                      </div>
                      <div class="mb-2 text-muted small">
                        <span>Size: </span>
                        <span></span>
                       
                      </div>
                      <p class="text-truncate mb-4 mb-md-0">
                        There are many variations of passages of Lorem Ipsum available, but the
                        majority have suffered alteration in some form, by injected humour, or
                        randomised words which don't look even slightly believable.
                      </p>
                    </div>
                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                      <div class="d-flex flex-row align-items-center mb-1">
                        <h4 class="mb-1 me-1">$13.99</h4>
                        <!-- <span class="text-danger"><s>$20.99</s></span> -->
                      </div>
                      <!-- <h6 class="text-success">Free shipping</h6> -->
                      <div class="d-flex flex-column mt-4">
                        <button class="btn btn-primary btn-sm" type="button">Product editing</button>
                        <button class="btn btn-outline-primary btn-sm mt-2" type="button">
                          Delete
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
         

        </div>
      </section>
</body>
</html>
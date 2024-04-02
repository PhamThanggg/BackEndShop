<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Azalea - Admin</title>
<!-- <link rel="icon" type="image/png" href="images/favicon.png"> -->
<!-- <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->
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

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Admin</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Admin</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
	<form action="" method="get">
		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">

								<div class="card-body">
									<h5 class="card-title">Sales</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">


											<span class="text-muted small pt-1 fw-bold">${totalP} product</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="card-body">
									<h5 class="card-title">Revenue</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>$3,264</h6>
											<span class="text-success small pt-1 fw-bold">8%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">

								<div class="card-body">
									<h5 class="card-title">Customers</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">


										<span class="text-muted small pt-1 fw-bold">${totalP} user</span>
										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">

								<div class="card-body">
									<h5 class="card-title">Reports</h5>

									<!-- Line Chart -->
									<div id="reportsChart"></div>

									<script>
                                            document.addEventListener("DOMContentLoaded", () => {
                                                new ApexCharts(document.querySelector("#reportsChart"), {
                                                    series: [{
                                                            name: 'Sales',
                                                            data: [31, 40, 28, 51, 42, 82, 56],
                                                        }, {
                                                            name: 'Revenue',
                                                            data: [11, 32, 45, 32, 34, 52, 41]
                                                        }, {
                                                            name: 'Customers',
                                                            data: [15, 11, 32, 18, 9, 24, 11]
                                                        }],
                                                    chart: {
                                                        height: 350,
                                                        type: 'area',
                                                        toolbar: {
                                                            show: false
                                                        },
                                                    },
                                                    markers: {
                                                        size: 4
                                                    },
                                                    colors: ['#4154f1', '#2eca6a', '#ff771d'],
                                                    fill: {
                                                        type: "gradient",
                                                        gradient: {
                                                            shadeIntensity: 1,
                                                            opacityFrom: 0.3,
                                                            opacityTo: 0.4,
                                                            stops: [0, 90, 100]
                                                        }
                                                    },
                                                    dataLabels: {
                                                        enabled: false
                                                    },
                                                    stroke: {
                                                        curve: 'smooth',
                                                        width: 2
                                                    },
                                                    xaxis: {
                                                        type: 'datetime',
                                                        categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                                                    },
                                                    tooltip: {
                                                        x: {
                                                            format: 'dd/MM/yy HH:mm'
                                                        },
                                                    }
                                                }).render();
                                            });
                                        </script>
									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">

								<div class="card-body">
									<h5 class="card-title">Recent Sales</h5>

									<table class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Customer</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Status</th>
											</tr>
										</thead>
										<tbody>
										<% int index = 0; %>
										<c:forEach items="${listP}" var="o">
										<% index++; %>
											<tr>
												<th scope="row"><a href="#">#<%= index %></a></th>
												<td>${o.name }</td>
												<td><a href="#" class="text-primary">${o.nameUser}</a></td>
												<td>$${o.price }</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
										</c:forEach>
												
											</tr>
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Recent Sales -->

						<!-- Top Selling -->
						<div class="col-12">
							<div class="card top-selling overflow-auto">

								<div class="card-body pb-0">
									<h5 class="card-title">Top Selling</h5>

									<table class="table table-borderless">
										<thead>
											<tr>
												<th scope="col">Preview</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Sold</th>
												<th scope="col">Revenue</th>
											</tr>
										</thead>
										<tbody>
												<c:forEach items="${listS}" var="o">
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-1.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">${o.name }</a></td>
												<td>$${o.price }</td>
												<td class="fw-bold">${o.sell}</td>
												<td>$${o.Revenue()}</td>
											</tr>
												</c:forEach>
											
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">
					<!-- Budget Report -->
					<div class="card">

						<div class="card-body pb-0">
							<h5 class="card-title">Budget Report</h5>

							<div id="budgetChart" style="min-height: 400px;" class="echart"></div>

							<script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                                            legend: {
                                                data: ['Allocated Budget', 'Actual Spending']
                                            },
                                            radar: {
                                                // shape: 'circle',
                                                indicator: [{
                                                        name: 'Sales',
                                                        max: 6500
                                                    },
                                                    {
                                                        name: 'Administration',
                                                        max: 16000
                                                    },
                                                    {
                                                        name: 'Information Technology',
                                                        max: 30000
                                                    },
                                                    {
                                                        name: 'Customer Support',
                                                        max: 38000
                                                    },
                                                    {
                                                        name: 'Development',
                                                        max: 52000
                                                    },
                                                    {
                                                        name: 'Marketing',
                                                        max: 25000
                                                    }
                                                ]
                                            },
                                            series: [{
                                                    name: 'Budget vs spending',
                                                    type: 'radar',
                                                    data: [{
                                                            value: [4200, 3000, 20000, 35000, 50000, 18000],
                                                            name: 'Allocated Budget'
                                                        },
                                                        {
                                                            value: [5000, 14000, 28000, 26000, 42000, 21000],
                                                            name: 'Actual Spending'
                                                        }
                                                    ]
                                                }]
                                        });
                                    });
                                </script>

						</div>
					</div>
					<!-- End Budget Report -->

					<!-- Website Traffic -->
					<div class="card">

						<div class="card-body pb-0">
							<h5 class="card-title">Website Traffic</h5>

							<div id="trafficChart" style="min-height: 400px;" class="echart"></div>

							<script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        echarts.init(document.querySelector("#trafficChart")).setOption({
                                            tooltip: {
                                                trigger: 'item'
                                            },
                                            legend: {
                                                top: '5%',
                                                left: 'center'
                                            },
                                            series: [{
                                                    name: 'Access From',
                                                    type: 'pie',
                                                    radius: ['40%', '70%'],
                                                    avoidLabelOverlap: false,
                                                    label: {
                                                        show: false,
                                                        position: 'center'
                                                    },
                                                    emphasis: {
                                                        label: {
                                                            show: true,
                                                            fontSize: '18',
                                                            fontWeight: 'bold'
                                                        }
                                                    },
                                                    labelLine: {
                                                        show: false
                                                    },
                                                    data: [{
                                                            value: 1048,
                                                            name: 'Search Engine'
                                                        },
                                                        {
                                                            value: 735,
                                                            name: 'Direct'
                                                        },
                                                        {
                                                            value: 580,
                                                            name: 'Email'
                                                        },
                                                        {
                                                            value: 484,
                                                            name: 'Union Ads'
                                                        },
                                                        {
                                                            value: 300,
                                                            name: 'Video Ads'
                                                        }
                                                    ]
                                                }]
                                        });
                                    });
                                </script>

						</div>
					</div>
					<!-- End Website Traffic -->

					<!-- News & Updates Traffic -->
					<div class="card">

						<div class="card-body pb-0">
							<h5 class="card-title">News &amp; Updates</h5>

							<div class="news">
								<div class="post-item clearfix">
									<img src="assets/img/news-1.jpg" alt="">
									<h4>
										<a href="#">Nihil blanditiis at in nihil autem</a>
									</h4>
									<p>Sit recusandae non aspernatur laboriosam. Quia enim
										eligendi sed ut harum...</p>
								</div>

								<div class="post-item clearfix">
									<img src="assets/img/news-2.jpg" alt="">
									<h4>
										<a href="#">Quidem autem et impedit</a>
									</h4>
									<p>Illo nemo neque maiores vitae officiis cum eum turos
										elan dries werona nande...</p>
								</div>

								<div class="post-item clearfix">
									<img src="assets/img/news-3.jpg" alt="">
									<h4>
										<a href="#">Id quia et et ut maxime similique occaecati ut</a>
									</h4>
									<p>Fugiat voluptas vero eaque accusantium eos. Consequuntur
										sed ipsam et totam...</p>
								</div>

								<div class="post-item clearfix">
									<img src="assets/img/news-4.jpg" alt="">
									<h4>
										<a href="#">Laborum corporis quo dara net para</a>
									</h4>
									<p>Qui enim quia optio. Eligendi aut asperiores enim
										repellendusvel rerum cuder...</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	</main>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="vendor/apexcharts/apexcharts.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/chart.js/chart.umd.js"></script>
	<script src="vendor/echarts/echarts.min.js"></script>
	<script src="vendor/quill/quill.min.js"></script>
	<script src="vendor/simple-datatables/simple-datatables.js"></script>
	<script src="vendor/tinymce/tinymce.min.js"></script>
	<script src="vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="js/main.js"></script>
</body>
</html>

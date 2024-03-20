<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
 <div id="shop">
	<div id="pages__header">
			<!-- <div class="pages__menu">
                <i class="ti-menu"></i>
                <ul class="pages__menu-responsive">
                    <li><a href="">Home</a></li>
                    <li><a href="">Shop</a></li>
                    <li><a href="">Pages</a></li>
                    <li><a href="">Blogs</a></li>
                    <li><a href="">Contact</a></li>
                </ul>
            </div> -->
			<div class="page__logo page__logo-iphoneX">
				<a href="home"><img width="120px" height="100%"
					src="img/logo.jpg" alt="Priazo" style="object-fit: cover;"></a>
			</div>

			<ul class="page__nav">
				<li><a href="home">Trang chủ</a></li>
				<li><a href="">Cửa hàng</a></li>
				<li><a href="">Trang</a></li>
				<li><a href="">Bài đăng</a></li>
				<li><a href="">Liên hệ</a></li>
				<c:if test="${sessionScope.acc.is_sell == 1}">
				<li><a href="">Manager Product</a></li>
				</c:if>
				<c:if test="${sessionScope.acc.is_admin == 1}">
				<li><a href="">Manager Product</a></li>
				</c:if>
				
				<c:if test="${sessionScope.acc == null}">
					<li><a href="Login.jsp">Đăng nhập</a></li>
				</c:if>
			</ul>

			<ul class="page__navIcon">
				<li><a class="page__navIcon-link" href="#"><i class="page__navIcon-icon ti-search"></i></a></li>
				<li class="header__list"><a class="page__navIcon-link " href="#"><i
							class="page__navIcon-icon ti-user"></i></a>
					<c:if test="${sessionScope.acc != null}">
					<ul class="header__list-item1">
						<li style="margin: 10px 0"><a href="EditProfile.jsp">Chỉnh sửa tài khoản</a></li>
						<li style="margin: 10px 0"><a href="ChangePass.jsp">Đổi mật khẩu</a></li>
						<li style="margin: 10px 0"><a href="logout">Đăng xuất</a></li>
					</ul>
					</c:if>
				</li>

				<li><a class="page__navIcon-link" href="#"><i class="page__navIcon-icon ti-heart"></i></a></li>
				<li><a class="page__navIcon-link" href="#"><i class="page__navIcon-icon ti-bag"></i></a></li>
			</ul>
		</div>
</div>

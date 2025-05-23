<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Sản phẩm</title>
	<%@include file="includes/head.jsp"%>
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" />
</head>
<body>

<div id="wrapper">
	<c:set var="user" value="${sessionScope.user}" />
	<header>
		<div class="inner-header container">
			<h6>
				HOTLINE:
				<span id="button"> 1900 8080</span>
			</h6>

			<nav>
				<ul id="top-header" class="navbar-nav ml-auto">
					<c:if test="${empty user}">
						<li class="nav-item dropdown"><a class="nav-link "
														 href="login.jsp"><i class="fa fa-sign-in"></i><span>
								</span> Đăng nhập</a></li>
					</c:if>
					<c:if test="${not empty user}">
						<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
								class=" fa fa-user px-1"></i> ${user.getEmail()}
						</a>
							<ul class="dropdown-menu">
								<c:if test="${user.getAccountRole() eq 'admin'}">
									<li><a class="dropdown-item"
										   href="admin/product-manage.jsp">Quản lí sản phẩm</a></li>
								</c:if>
								<li><a class="dropdown-item"
									   href="customer/cartCustomer.jsp">Giỏ hàng</a></li>
								<li><a class="dropdown-item" href="changePassword.jsp">Đổi
									mật khẩu</a></li>
								<li><a class="dropdown-item" href="sign_out">Đăng xuất</a></li>
							</ul></li>
					</c:if>

				</ul>
			</nav>
		</div>

		<div class="grid container">
			<a href="index.jsp" id="logo">Pharmacy</a>
			<nav>
				<ul id="main-menu">
					<li><a href="index.jsp"><span style="color: blue">Trang chủ</span></a></li>
					<li><a href="product-list"><span style="color: blue">Sản phẩm</span></a></li>
					<!--
                    <li><a href="#">Khuyến mãi</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    -->
				</ul>
			</nav>
			<div class="tools-menu">
				<div class="search-box">
					<form action="FindProductByNameServlet" method="get"
						  id="search-box">
						<input type="text" name="productName" id="search-text"
							   placeholder="Tìm kiếm...">
						<button id="search-btn" value="">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>

				</div>

				<a href="#" class="nav-link"> <i class="fa-solid fa-bell"></i></a>
				<a href="customer/cartCustomer.jsp" class="nav-link"><i
						class="fa-solid fa-cart-shopping"></i></a>
			</div>
		</div>
	</header>

	<div id="content" class="container">

		<div class="head-content">
			<hr>
			<p>
				Các ưu đãi hấp dẫn đang chờ bạn
			</p>
			<hr>
		</div>

		<!-- Thêm phần hiển thị thông báo ở đây -->
		<c:if test="${not empty message}">
			<div style="background-color: #d4edda; color: #155724; padding: 10px; margin: 10px 0; border: 1px solid #c3e6cb; border-radius: 5px;">
					${message}
			</div>
		</c:if>

		<form action="AscendingOrder">
			<button type="submit" class="btn btn-outline-primary">
				Sắp xếp tăng dần
			</button>
		</form>
		<form action="DescendingOrder">
			<button type="submit" class="btn btn-outline-primary">
				Sắp xếp giảm dần
			</button>
		</form>

		<!-- Category -->
		<div id="contentProducts" class="grid-custom grid-col-4">
			<c:forEach items="${listP}" var="p">
				<div class=" product body-content">
					<div class="product-card">
						<a href="product-detail?productID=${p.productID}"><img
								src="${p.img}" class="card-improduct-top card-img-top "
								alt="hình ảnh sản phẩm"></a>
						<div class="card-body">
							<h5 class="price">${p.formatPrice(p.getPriceSale()) }</h5>
							<p class="text"
							   style="max-height: 3em; overflow: hidden; text-overflow: ellipsis;">
								<a href="product-detail?productID=${p.productID}">${p.productName}</a>
							</p>
							<div class="options">
								<c:if test="${not empty user}">
									<a
											href="add-cart?productID=${p.productID}&customerID=${user.customerID}"
											class="btn btn-primary">Thêm vào giỏ</a>
								</c:if>
								<c:if test="${empty user}">
									<span>Bạn cần đăng nhập để mua hàng</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- Category End-->
	</div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>

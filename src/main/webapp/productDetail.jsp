<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Chi tiết sản phẩm</title>
	<%@include file="includes/head.jsp"%>
</head>
<body>

<div id="wrapper">
	<c:set var="user" value="${sessionScope.user}" />
	<header>
		<div class="inner-header container">
			<h6>
				HOTLINE: <span id="button"> 1900 8080</span>
			</h6>

			<nav>
				<ul id="top-header" class="navbar-nav ml-auto">
					<c:if test="${empty user}">
						<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="login.jsp"><i
								class="fa fa-sign-in"></i> Đăng nhập</a></li>
					</c:if>
					<c:if test="${not empty user}">
						<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
								class=" fa fa-user px-1"></i> ${user.getEmail()}
						</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="cartCustomer.jsp">Giỏ hàng</a></li>
								<li><a class="dropdown-item" href="changePassword.jsp">Đổi mật khẩu</a></li>
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
					<li><a href="index.jsp">Trang chủ</a></li>
					<li><a href="product-list">Sản phẩm</a></li>
					<li><a href="#">Khuyến mãi</a></li>
					<li><a href="#">Giới thiệu</a></li>
				</ul>
			</nav>
			<div class="tools-menu">
				<form action="" id="search-box">
					<input type="text" name="" id="search-text"
						   placeholder="Tìm kiếm" required>
					<button id="search-btn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
				<a href="#" class="nav-link"> <i class="fa-solid fa-bell"></i></a>
				<a href="customer/cartCustomer.jsp" class="nav-link"><i
						class="fa-solid fa-cart-shopping"></i></a>
			</div>
		</div>
	</header>

	<div id="content" class="resize">
		<div class="container grid-custom grid-col-3">
			<img class="img" src="${product.img}" alt="hình ảnh sản phẩm">
			<div class="card-body">
				<table>
					<tr>
						<td><p class="card-text">
							Thương hiệu: <span>${product.manufacture.name }</span>
						</p></td>
						<td style="padding-left: 50px"><p class="card-text">
							Ngày sản xuất: <span>${product.dateOfmanufacture}</span>
						</p></td>
					</tr>
					<tr>
						<td><p class="card-text">
							Số lượng tồn kho: <span>${product.quantityInStock}</span>
						</p></td>
						<td style="padding-left: 50px"><p class="card-text">
							Hạn sử dụng: <span>${product.expiry }</span>
						</p></td>
					</tr>
				</table>
				<br>

				<h4>Giá: ${product.formatPrice(product.getPriceSale()) }</h4>
				<br>

				<c:if test="${empty user}">
					<span>Bạn cần đăng nhập để mua hàng</span>
				</c:if>
				<c:if test="${not empty user}">
					<a href="add-cart?productID=${product.productID}&customerID=${user.customerID}"><button type="button" class="b">Thêm vào giỏ</button></a>
				</c:if>

				<div class="content">
					<h3>Công dụng sản phẩm</h3>
					<p class="card-text">${product.detailUses}</p>
				</div>
			</div>
			<div></div>
		</div>
	</div>
</div>
<%@include file="includes/footer.jsp"%>

</body>
</html>

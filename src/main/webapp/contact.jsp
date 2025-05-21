<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Nhà Thuốc</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="style.css">
	<link href="./icon/fontawesome-free-6.4.2-web/fontawesome-free-6.4.2-web/css/all.css" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" crossorigin="anonymous"></script>
</head>
<body>
<c:set var="user" value="${sessionScope.user}" />

<!-- Thanh điều hướng trên cùng -->
<nav class="sticky-top">
	<nav class="green-color navbar navbar-expand-md navbar-light bg-light">
		<div class="container-fluid px-2">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">Tổng đài miễn phí</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-phone"></i> 1900 8080</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<!-- Bỏ phần chọn ngôn ngữ -->
				<c:if test="${empty user}">
					<li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fa fa-sign-in"></i> Đăng nhập</a></li>
				</c:if>
				<c:if test="${not empty user}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
						   aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-user px-1"></i> ${user.email}
						</a>
						<div class="dropdown-menu bgcl" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Giỏ hàng</a>
							<a class="dropdown-item" href="changePassword.jsp">Đổi mật khẩu</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="sign_out">Đăng xuất</a>
						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</nav>

	<nav class="navbar navbar-expand-md navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand px-2" href="#"><img src="./img/logoPhamarcy.png" height="70" alt="Logo Nhà Thuốc"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>
			<form class="d-flex px-5 w-75" role="search" method="GET" action="search.jsp">
				<input class="form-control mr-2" type="search" name="query" placeholder="Tìm kiếm" aria-label="Tìm kiếm">
				<button class="btn btn-outline-success px-3" type="submit">Tìm kiếm</button>
			</form>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="product.jsp">Sản phẩm</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Thực phẩm chức năng</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Chăm sóc sức khỏe</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><span style="color: rgb(51, 174, 89); font-weight: bolder;">Liên hệ</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
</nav>

<!-- Phần liên hệ -->
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center"></div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters mb-5">
						<div class="col-md-7">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">Liên hệ với chúng tôi</h3>
								<div id="form-message-warning" class="mb-4"></div>
								<div id="form-message-success" class="mb-4">Tin nhắn của bạn đã được gửi, cảm ơn!</div>
								<form method="POST" id="contactForm" name="contactForm" class="contactForm" action="sendContact">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="name">Họ và tên</label>
												<input type="text" class="form-control" name="name" id="name" placeholder="Họ và tên" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="email">Email</label>
												<input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="subject">Chủ đề</label>
												<input type="text" class="form-control" name="subject" id="subject" placeholder="Chủ đề" required>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="message">Nội dung</label>
												<textarea name="message" class="form-control" id="message" cols="30" rows="4" placeholder="Nội dung" required></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="submit" value="Gửi" class="btn btn-primary">
												<div class="submitting"></div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-5 d-flex align-items-stretch">
							<div id="map" class="py-4">
								<img src="../img/map.png" style="max-width: 650px; max-height: auto;" alt="Bản đồ">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Footer -->
<footer class="bg-dark text-center text-white">
	<div class="container p-4">
		<section>
			<div class="row">
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
					<h3 class="text-uppercase">Về chúng tôi</h3>
					<ul class="list-unstyled mb-0 px-5 text-left">
						<li><a href="#!" class="text-white">Giới thiệu</a></li>
						<li><a href="#!" class="text-white">Hệ thống cửa hàng</a></li>
						<li><a href="#!" class="text-white">Giấy phép kinh doanh</a></li>
						<li><a href="#!" class="text-white">Quy chế hoạt động</a></li>
						<li><a href="#!" class="text-white">Chính sách đổi trả</a></li>
						<li><a href="#!" class="text-white">Chính sách giao hàng</a></li>
						<li><a href="#!" class="text-white">Chính sách bảo mật</a></li>
						<li><a href="#!" class="text-white">Chính sách thanh toán</a></li>
						<li><a href="#!" class="text-white">Thể lệ chương trình thẻ thành viên</a></li>
						<li><a href="#!" class="text-white">Tuyển dụng</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
					<h3 class="text-uppercase">Dịch vụ</h3>
					<ul class="list-unstyled mb-0 px-5 text-left">
						<li><a href="#!" class="text-white">Tư vấn trực tuyến</a></li>
						<li><a href="#!" class="text-white">Hỏi đáp</a></li>
						<li><a href="#!" class="text-white">Giao hàng nhanh</a></li>
						<li><a href="#!" class="text-white">Tư vấn sử dụng thuốc</a></li>
						<li><a href="#!" class="text-white">Hỗ trợ khách hàng</a></li>
						<li><a href="#!" class="text-white">Mua thuốc trực tuyến</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
					<h3 class="text-uppercase">Thông tin liên hệ</h3>
					<ul class="list-unstyled mb-0 px-5 text-left">
						<li><a href="#!" class="text-white">Hỗ trợ khách hàng: 1900 8080</a></li>
						<li><a href="#!" class="text-white">Email: cskh@nhathuoc.vn</a></li>
						<li><a href="#!" class="text-white">Địa chỉ: 123 Đường A, Quận B, Thành phố C</a></li>
						<li><a href="#!" class="text-white">Facebook: fb.com/nhathuoc</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
					<h3 class="text-uppercase">Thanh toán</h3>
					<img src="../img/pay.png" alt="Các phương thức thanh toán" style="width: 100%;">
				</div>
			</div>
		</section>
	</div>
	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
		© 2024 Nhà Thuốc. Bản quyền thuộc về Nhà Thuốc.
	</div>
</footer>

</body> </html> ```

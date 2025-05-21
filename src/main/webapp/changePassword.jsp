<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Đổi Mật Khẩu</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

	<!-- Font Awesome (optional) -->
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" href="css/style.css">

	<style>
		body {
			background-color: #f8f9fa;
			padding: 50px;
			text-align: center;
		}

		#logo {
			font-size: 24px;
			font-weight: bold;
			text-decoration: none;
			color: #000;
		}

		h3 {
			margin-top: 20px;
			margin-bottom: 30px;
		}

		.card {
			max-width: 50%;
			margin: 0 auto;
			padding: 20px;
		}

		.form-control {
			margin-bottom: 15px;
		}

		#message {
			margin-top: 5px;
			display: block;
		}

		.btn-primary {
			margin-top: 20px;
		}
	</style>
</head>

<body>
<div class="container">
	<a href="index.jsp" id="logo">Nhà Thuốc</a>
	<c:set var="notify" value="${notify}" />

	<h3>Đổi Mật Khẩu</h3>

	<div class="card">
		<span style="color: red">${notify}</span>
		<form action="change-password" method="post">
			<div class="mb-3">
				<input type="password" name="currentPassword" class="form-control"
					   placeholder="Mật khẩu hiện tại" required>
			</div>
			<div class="mb-3">
				<input type="password" name="newPassword" class="form-control"
					   placeholder="Mật khẩu mới" required id="newPassword">
			</div>
			<div class="mb-3">
				<input type="password" name="reNewPassword" class="form-control"
					   placeholder="Nhập lại mật khẩu mới" required id="reNewPassword" onkeyup="checkPwd()">
				<span id="message" style="color: red"></span>
			</div>
			<div class="btn-group" role="group">
				<button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
			</div>
		</form>
	</div>

	<a href="index.jsp">
		<button class="btn btn-primary mt-3">Về trang chủ</button>
	</a>
</div>

<script>
	function checkPwd() {
		let pwd = document.getElementById("newPassword").value;
		let rePwd = document.getElementById("reNewPassword").value;
		if (pwd !== rePwd) {
			document.getElementById("message").innerHTML = "Mật khẩu không khớp!";
			return false;
		} else {
			document.getElementById("message").innerHTML = "";
			return true;
		}
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="../js/script.js"></script>
</body>
</html>

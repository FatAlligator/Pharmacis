<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body class="form-bg" style="background-color: rgb(140,202,204) !important;">

<div class="container ">
	<a href="index.jsp" id="logo">Pharmacy</a>
	<div class="card-header">
		<div class="tab-group resize">
			<h3>Đăng ký tài khoản</h3>
		</div>
		<div class="card w-50 mx-auto my-5">
			<div id="signup" class="resize banner card-body ">

				<form action="sign-up" method="post">
					<div class=" mb-3">
						<div class=" text-center ">
							<div class="row ">
								<div class="col">
									<input id="name" type="text" class="form-control"
										   name="lastName" placeholder="Họ" aria-label="Last name">
								</div>
								<div class="col">
									<input id="name" type="text" class="form-control"
										   name="firstName" placeholder="Tên" aria-label="First name">
								</div>
								<div class="col col-lg-2">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="sex"
											   value="Male" id="flexRadioDefault1" checked> <label
											class="form-check-label" for="genderCheck">Nam</label>
									</div>
								</div>
								<div class="col col-lg-2">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="sex"
											   value="Female" id="flexRadioDefault2"> <label
											class="form-check-label" for="genderCheck">Nữ</label>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class=" mb-3">
						<input type="text" name="email" class="form-control"
							   id="inputEmail" placeholder="Email" aria-label="email">
					</div>

					<div class="mb-3">
						<input type="text" name="address" class="form-control"
							   id="inputAddress" placeholder="Địa chỉ">
					</div>

					<div class="mb-3">
						<input type="text" name="telephone" class="form-control"
							   id="inputPhoneNumber" placeholder="Số điện thoại">
					</div>

					<div class="row">
						<div class="col">
							<input type="password" name="password" class="form-control"
								   id="password" placeholder="Mật khẩu" aria-label="password"
								   onkeyup="checkPwd()"> <span id="passwordHelpInline"
															   class="form-text">Mật khẩu nên có ít nhất 6 ký tự</span>
						</div>
						<div class="col">
							<input type="password" name="repassword" class="form-control"
								   id="rePassword" placeholder="Nhập lại mật khẩu"
								   aria-label="repassword" onkeyup="checkPwd()"> <span
								id="message" style="color: red"></span>
						</div>
					</div>
					<div class="mb-3">
						<div class="form-check">
							<input class="form-check-input" name="check" type="checkbox"
								   value="check" id="gridCheck" required> <label
								class="form-check-label" for="gridCheck">Tôi đồng ý với các điều khoản</label>
						</div>
					</div>
					<div class="col-12">
						<button type="submit" value="signup" class="button button-block">Đăng ký</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>

<script>
	function checkPwd() {
		const pwd = document.getElementById("password").value;
		const rePwd = document.getElementById("rePassword").value;
		if (pwd !== rePwd) {
			document.getElementById("message").innerHTML = "Mật khẩu không khớp!";
			return false;
		} else {
			document.getElementById("message").innerHTML = "";
			return true;
		}
	}
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="../js/script.js"></script>

</html>

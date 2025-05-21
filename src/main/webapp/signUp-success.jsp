<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Đăng ký thành công</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
            text-align: center;
        }
        p {
            color: #28a745; /* màu xanh lá thành công */
            font-size: 24px;
            margin-bottom: 20px;
        }
        a.login-link {
            color: #007bff;
            font-size: 18px;
            text-decoration: none;
        }
        a.login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <p>Chúc mừng bạn đã đăng ký tài khoản thành công</p>
            <p><a class="login-link" href="login.jsp">Đăng nhập</a></p>
        </div>
    </div>
</div>

<!-- Bootstrap JS + Popper + jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

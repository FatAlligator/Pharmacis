<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="../includes/head.jsp"%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
    /* giữ nguyên style của bạn */
    body { font-family: Arial; font-size: 17px; padding: 8px; }
    * { box-sizing: border-box; }
    .row { display: flex; flex-wrap: wrap; margin: 0 -16px; }
    .col-25 { flex: 25%; padding: 0 16px; }
    .col-50 { flex: 50%; padding: 0 16px; }
    .col-75 { flex: 75%; padding: 0 16px; }
    .container { background-color: #f2f2f2; padding: 5px 20px 15px 20px; border: 1px solid lightgrey; border-radius: 3px; }
    input[type=text] { width: 100%; margin-bottom: 20px; padding: 12px; border: 1px solid #ccc; border-radius: 3px; }
    label { margin-bottom: 10px; display: block; }
    .btn { background-color: #04AA6D; color: white; padding: 12px; margin: 10px 0; border: none; width: 100%; border-radius: 3px; cursor: pointer; font-size: 17px; }
    .btn:hover { background-color: #45a049; }
    hr { border: 1px solid lightgrey; }
    .price { float: right; color: grey; }
    @media (max-width: 800px) {
      .row { flex-direction: column-reverse; }
      .col-25 { margin-bottom: 20px; }
    }
  </style>
</head>

<body>
<fmt:setLocale value="${sessionScope.LANG}" />
<fmt:setBundle basename="language.lang" />

<h2>Đặt hàng</h2>
<p>Vì lí do hạn chế khu vực, vui lòng kiểm tra kĩ trong quá trình đặt hàng.</p>

<!-- THÔNG BÁO LỖI -->
<c:if test="${not empty error}">
  <div style="color: red; font-weight: bold; margin-bottom: 10px;">
      ${error}
  </div>
</c:if>

<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="AddNewOrder" method="post">
        <div class="row">
          <div class="col-50">
            <h3>Thông tin người nhận</h3>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="ordererEmail" placeholder="Email tài khoản*" required>

            <label for="adr"><i class="fa fa-address-card-o"></i> Địa chỉ</label>
            <input type="text" id="adr" name="adr" placeholder="Địa chỉ giao hàng*" required>
          </div>

          <div class="col-50">
            <h3>Thanh toán</h3>
            <p style="color: red;"><strong>Thanh toán khi nhận hàng*</strong></p>
            <small>(*) Hiện tại chỉ hỗ trợ thanh toán trực tiếp khi nhận hàng (miễn phí)</small>
          </div>
        </div>

        <input type="submit" value="Đặt hàng" class="btn">
      </form>
    </div>
  </div>

  <!-- GIỎ HÀNG -->
  <div class="col-25">
    <div class="container">
      <h4>Giỏ hàng <span class="price"><i class="fa fa-shopping-cart"></i></span></h4>

      <c:set var="totalPrice" value="0" />
      <c:if test="${not empty order and not empty order.orderDetails}">
        <c:forEach items="${order.orderDetails}" var="item">
          <p>
            <img src="${item.product.img}" alt="" width="50">
              ${item.product.productName} x ${item.quantity}
            <span class="price">${item.getSingleP()}</span>
          </p>
          <c:set var="totalPrice" value="${totalPrice + item.getSingleP()}" />
        </c:forEach>
      </c:if>

      <hr>
      <p>Tổng <span class="price">
        <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₫" />
      </span></p>

      <div style="text-align: right;">
        <a href="cartCustomer.jsp"><button type="button" class="btn">← Quay lại giỏ hàng</button></a>
      </div>
    </div>
  </div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">
<title>Insert title here</title>
<!-- Customized Bootstrap Stylesheet -->
<!-- Favicon -->
<link href="favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/forUser/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row bg-secondary py-1 px-xl-5">

			<div class="col-lg-6 text-center text-lg-right">

				<div class="d-inline-flex align-items-center d-block d-lg-none">
					<a href="" class="btn px-0 ml-2"> <i
						class="fas fa-heart text-dark"></i> <span
						class="badge text-dark border border-dark rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a> <a href="" class="btn px-0 ml-2"> <i
						class="fas fa-shopping-cart text-dark"></i> <span
						class="badge text-dark border border-dark rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a>
				</div>
			</div>
		</div>
		<div
			class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">



		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">

			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">

					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="/user/index" class="nav-item nav-link active">Home</a> <a
								href="/user/shop" class="nav-item nav-link">Shop</a>
							<!-- <a
								href="/user/detail" class="nav-item nav-link">Shop Detail</a> -->
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">My Account<i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<%
									if (session.getAttribute("account") == null) {
									%>
									<a href="/user/login" class="dropdown-item">Sign in</a> <a
										href="#" class="dropdown-item">Sign up</a>
									<%
									} else {
									%>
									<a href="/logout" class="dropdown-item">Logout</a>
									<%
									}
									%>
								</div>

							</div>
							<a href="/user/contact" class="nav-item nav-link">Contact</a>
						</div>
						<div class="col-lg-4 col-6 text-left">
							<form action="">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for products">
									<div class="input-group-append">
										<span class="input-group-text bg-transparent text-primary">
											<i class="fa fa-search"></i>
										</span>
									</div>
								</div>
							</form>
						</div>
						<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
							<a href="" class="btn px-0"> <i
								class="fas fa-heart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">0</span>
							</a> <a href="/user/cart" class="btn px-0 ml-3"> <i
								class="fas fa-shopping-cart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">${cartSize}</span>
							</a>

						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a
						class="breadcrumb-item text-dark" href="#">Shop</a> <span
						class="breadcrumb-item active">Shopping Cart</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- cart.jsp -->






	<!-- Cart Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<table class="table table-light table-borderless table-hover text-center mb-0">
    <c:choose>
        <c:when test="${not empty emptyCartMessage}">
            <thead class="thead-dark">
                <tr>
                    <th colspan="5">Empty Cart</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5">${emptyCartMessage}</td>
                </tr>
            </tbody>
        </c:when>
        <c:otherwise>
            <thead class="thead-dark">
                <tr>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="total" value="0" />
                <c:forEach var="item" items="${cart.getItems()}">
                    <c:set var="itemTotal" value="${item.price * item.qty}" />
                    <c:set var="total" value="${total + itemTotal}" />
                        <tr>
                            <td class="align-middle"><img src="/images/${item.image}" alt="" style="width: 50px;"> ${item.name}</td>
                            <td class="align-middle">${item.price}</td>
                            <td class="align-middle"><input name="qty" min="1" value="${item.qty}" onblur="this.form.submit()" style="width: 50px;"></td>
                            <td class="align-middle">${itemTotal}</td>
                            <td class="align-middle">
    <form action="/cart/remove/${item.id}" method="post">
        <button type="submit" class="btn btn-sm btn-danger">Remove</button>
    </form>
</td>

                            <input type="hidden" name="id" value="${item.id}">
                        </tr>
                </c:forEach>
            </tbody>
        </c:otherwise>
    </c:choose>
</table>

				<a href="/order/history">View Orders</a>
			</div>
			
			<div class="col-lg-4">
				<form class="mb-30" action="">
					<div class="input-group">
						<input type="text" class="form-control border-0 p-4"
							placeholder="Coupon Code">
						<div class="input-group-append">
							<button class="btn btn-primary">Apply Coupon</button>
						</div>
					</div>
				</form>
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Cart Summary</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="border-bottom pb-2">
						<div class="d-flex justify-content-between mb-3">
							<h6>Subtotal</h6>
							<h6>${total}</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">10</h6>
						</div>
					</div>
					<div class="pt-2">
						<div class="d-flex justify-content-between mt-2">
							<h5>Total</h5>
							<h5>${total+10}</h5>
						</div>

						<%
    // Kiểm tra nếu có thông báo giỏ hàng trống
    String message = request.getParameter("message");
                  boolean notLoggedIn = message != null && message.equals("notloggedin");

    boolean isCartEmpty = message != null && message.equals("empty");
%>

						<% if (message != null && message.equals("notloggedin")) { %>
						<p>Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.</p>
						<a href="/user/login">Đăng nhập</a>
						<% } else { %>
						<form method="post" action="/checkout">
							<!-- Các trường khác -->
							<input type="hidden" name="username" value="${username}">
							<input type="text" name="address" placeholder="Địa chỉ" required>
							<!-- Các trường khác -->
							<button class="btn btn-primary" type="submit" <% if (isCartEmpty) { %> disabled <% } %>>Checkout</button>
						</form>
						<% } %>





						<!--                     <a class="btn btn-primary" href="/checkout" role="button"> Proceed To Checkout</a>
 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cart End -->


	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
		<div class="row px-xl-5 pt-5">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
				<p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed
					clita kasd clita et et dolor sed dolor. Rebum tempor no vero est
					magna amet no</p>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street,
					New York, USA
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope text-primary mr-3"></i>info@example.com
				</p>
				<p class="mb-0">
					<i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890
				</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="/user/index"><i
								class="fa fa-angle-right mr-2"></i>Home</a> <a
								class="text-secondary mb-2" href="/user/shop"><i
								class="fa fa-angle-right mr-2"></i>Our Shop</a> <a
								class="text-secondary mb-2" href="/user/detail"><i
								class="fa fa-angle-right mr-2"></i>Shop Detail</a> <a
								class="text-secondary mb-2" href="/user/cart"><i
								class="fa fa-angle-right mr-2"></i>Shopping Cart</a> <a
								class="text-secondary mb-2" href="/user/checkout"><i
								class="fa fa-angle-right mr-2"></i>Checkout</a> <a
								class="text-secondary" href="#"><i
								class="fa fa-angle-right mr-2"></i>Contact Us</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">My Account</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Home</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Our Shop</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Shop Detail</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Shopping Cart</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Checkout</a> <a
								class="text-secondary" href="#"><i
								class="fa fa-angle-right mr-2"></i>Contact Us</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
						<p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
						<form action="">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Your Email Address">
								<div class="input-group-append">
									<button class="btn btn-primary">Sign Up</button>
								</div>
							</div>
						</form>
						<h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
						<div class="d-flex">
							<a class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-linkedin-in"></i></a> <a
								class="btn btn-primary btn-square" href="#"><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row border-top mx-xl-5 py-4"
			style="border-color: rgba(256, 256, 256, .1) !important;">
			<div class="col-md-6 px-xl-0">
				<p class="mb-md-0 text-center text-md-left text-secondary">
					&copy; <a class="text-primary" href="#">Domain</a>. All Rights
					Reserved. Designed by <a class="text-primary"
						href="https://htmlcodex.com">HTML Codex</a>
				</p>
			</div>
			<div class="col-md-6 px-xl-0 text-center text-md-right">
				<img class="img-fluid" src="img/payments.png" alt="">
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="/forUser/js/main.js"></script>
</body>
</html>
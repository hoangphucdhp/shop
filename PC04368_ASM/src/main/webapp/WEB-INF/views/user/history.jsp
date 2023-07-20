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
						class="breadcrumb-item text-dark" href="#">Shop</a> 
						 <a
						class="breadcrumb-item text-dark" href="#">Shopping Cart</a> <span
						class="breadcrumb-item active">History</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->
 <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
<h1>Order History</h1>
<c:if test="${not empty orders}">
<table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                             <th>Mã đơn hàng</th>
                            <th>Ngày tạo</th>
                            <th>Trạng thái</th>
                            <th></th>
                            
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <tr>
                         <c:forEach items="${orders}" var="order">
                            <td class="align-middle"> ${order.id}</td>
                            <td class="align-middle">${order.createDate}</td>
                            
                            <td class="align-middle">${order.status}</td>
                            <td class="align-middle"><a href="/history/${order.id}">View detail</a></td>
                        </tr>
                          </c:forEach>
                        </tbody>
                        </table>
                        </c:if>
                        <c:if test="${empty orders}">
    <p>Không có đơn hàng nào.</p>
</c:if>
                        
</div>
</div>

</div>





	<!-- cart.jsp -->


    



</body>
</html>

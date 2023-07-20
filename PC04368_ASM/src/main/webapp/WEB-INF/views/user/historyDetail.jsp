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
        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Detail</span></h5>
                <div class="bg-light p-30 mb-5">
               
                    <div class="">
                        <div class="d-flex justify-content-between mb-3">
                        <div class="border-bottom pb-2">
                           <table>
		<tr >
			<th style="padding-right: 50px">ID</th>
			<th style="padding-right: 70px">OrderID</th>
			<th style="padding-right: 200px">Product Name</th>
			<th style="padding-right: 150px">Price</th>
			<th style="padding-right: 100px">Quantity</th>
			<!-- Add more columns as per your OrderDetail entity structure -->
		</tr>

		<c:forEach var="orderDetail" items="${order.orderDetails}">
			<tr>
			
				<td>${orderDetail.id}</td>
				<td>${orderDetail.order.id}</td>
				<td>${orderDetail.product.name}</td>
				<td>${orderDetail.price}</td>
				<td>${orderDetail.quantity}</td>

				<!-- Display more properties of OrderDetail as per your requirements -->
			</tr>
		</c:forEach>
	</table>
	</div>
                            
                        </div>
                       
                        
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5>${order.getTotalPrice()}</h5>
                        </div>
<!--                         <button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button>
 -->                    </div>
                   
                </div>
            </div>
</div>


</div>
        




	<!-- cart.jsp -->


    



</body>
</html>

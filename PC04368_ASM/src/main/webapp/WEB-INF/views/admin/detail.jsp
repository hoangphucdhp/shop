<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Order Details</title>
</head>
<body>
	<h1>Order Details</h1>
	<h2>Status: ${order.status}</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>OrderID</th>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>
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

	<h2>Total Price: ${order.getTotalPrice()}</h2>
</body>
</html>

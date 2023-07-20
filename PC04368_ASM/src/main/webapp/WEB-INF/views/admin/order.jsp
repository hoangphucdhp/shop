<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Order Management</title>
</head>
<body>
	<h1>Order Management</h1>

	<table>
		<tr>
			<th>Order ID</th>
			<th>Address</th>
			<th>Create Date</th>
			<th>Account</th>
			<th>Action</th>
		</tr>
		<c:forEach var="order" items="${orders}">
			<tr>
				<td>${order.id}</td>
				<td>${order.address}</td>
				<td>${order.createDate}</td>
				<td>${order.account.username}</td>
				<td><a href="/order/${order.id}">View detail</a></td>
				<td>
					<form action="order" method="post">
						<input type="hidden" name="orderId" value="${order.id}"> <select
							name="status">
							<option value="Đang xử lý"
								${order.status eq 'Đang xử lý' ? 'selected' : ''}>Đang
								xử lý</option>
							<option value="Đang giao"
								${order.status eq 'Đang giao' ? 'selected' : ''}>Đang
								giao</option>
							<option value="Đã giao"
								${order.status eq 'Đã giao' ? 'selected' : ''}>Đã giao</option>
						</select> <input type="submit" value="Lưu">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

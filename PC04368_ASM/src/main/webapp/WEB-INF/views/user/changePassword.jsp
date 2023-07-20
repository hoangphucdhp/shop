<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/forUser/css/style2.css">
</head>
<body>
	<div class="login-page">
		<div class="form">
			<h1>CHANGE PASSWORD</h1>
			<form action="${pageContext.request.contextPath}/user/changePassword"
				method="post" class="login-form">
				<input type="hidden" name="username" value="${account.username}">
				<input type="password" name="currentPassword"
					placeholder="Current Password" required> <input
					type="password" name="newPassword" placeholder="New Password"
					required> <input type="password" name="confirmPassword"
					placeholder="Confirm New Password" required>
				<button type="submit">Change</button>
				<p>${error}</p>
			</form>
		</div>
	</div>
</body>
</html>
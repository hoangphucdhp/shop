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
			<h1>REGISTRATION</h1>
			<form action="${pageContext.request.contextPath}/user/registration"
				method="post" enctype="multipart/form-data">
				<input type="text" placeholder="Username" name="username" required /><br>
				<input type="text" placeholder="Fullname" name="fullname" required /><br>
				<input type="password" placeholder="Password" name="password"
					required /><br> <input type="text" placeholder="Email"
					name="email" required /><br> <input type="file" name="file"
					required /><br>
				<button type="submit">Sign up</button>
			</form>
		</div>
	</div>
</body>
</html>
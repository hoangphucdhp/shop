<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/forUser/css/style2.css">
</head>
<body>
	<div class="login-page">
		<div class="form">
			<h1>FORGOT PASSWORD</h1>
			<form class="login-form" method="post" th:action="@{/user/forgotPassword}">
				<input type="text" placeholder="email address" name="email" />
				<button type="submit">Send Mail</button>
			</form>
		</div>
	</div>
</body>
</html>



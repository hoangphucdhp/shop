<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/forUser/css/style2.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
	<div class="login-page">
		<div class="form">
			<h1>LOGIN</h1>
			<form action="/user/login" method="post" class="login-form">
				<input name="username" type="text" placeholder="username" /> <input
					name="password" type="password" placeholder="password" />
				<button>login</button>
				<p class="message">
					Not registered? <a href="/user/registration">Create an account</a>
				</p>
			</form>
			<%-- <p>${error}</p> --%>
		</div>
	</div>
</body>
<script>
  // Kiểm tra nếu giá trị `${error}` không rỗng
  if ('${error}' !== '') {
    // Sử dụng hàm Swal.fire() để tạo thông báo SweetAlert
    Swal.fire({
      icon: 'error',
      title: 'Login Error',
      text: '${error}',
    });
  }
</script>

</html>
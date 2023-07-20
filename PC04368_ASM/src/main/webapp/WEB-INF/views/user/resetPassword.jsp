<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link rel="stylesheet" href="/forUser/css/style2.css">
</head>
<body>
    <div class="login-page">
        <div class="form">
            <h1>RESET PASSWORD</h1>
            <form class="login-form" action="/user/resetPassword" method="post">
                <input type="hidden" name="email" value="${email}" />
                <input type="password" name="newPassword" placeholder="New password" required />
                <input type="password" name="confirmPassword" placeholder="Confirm password" required />
                <button type="submit">Reset</button>
            </form>
        </div>
    </div>
</body>
</html>

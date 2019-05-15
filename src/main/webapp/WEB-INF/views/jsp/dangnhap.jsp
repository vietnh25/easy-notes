<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<jsp:include page="header.jsp" />

	<title>Đăng nhập</title>
</head>

<body id="body-login">

	<div id="body-flex-login">
		<div id="container-login">
			<div id="container-login-left">
				<div class="header-login" id="header-left">
					<span id="text-logo">Welcome</span><br>
					<span id="hint-text-logo">Hãy tạo nên phong cách của bạn cùng Tôi</span>
				</div>

				<div id="nofitical">
					<p><img alt="icon_oval" src="../Library/Img/icon_oval.png"
							style="height: 15px;width: 15px" /><span>Luôn cập nhật xu thế thời trang mới nhất</span></p>
					<p><img alt="icon_oval" src="../Library/Img/icon_oval.png"
							style="height: 15px;width: 15px" /><span>Giảm hơn 50% tất cả các mặt hàng giành cho khác
							VIP</span></p>
					<p><img alt="icon_oval" src="../Library/Img/icon_oval.png"
							style="height: 15px;width: 15px" /><span>Tận tình tư vấn để tạo nên phong các của bạn</span>
					</p>
				</div>

				<!-- <form  ethod="post">
		Tên đăng nhập<input type="text" name="username">
		Mật Khẩu     <input type="password" name="password">
		<input type="submit" onclick=""> -->
			</div>
			<div id="container-login-right">
				<div class="container-login-form" id="container-login-right">
					<nav>
						<div>
							<span
								style="color:#3300FF;cursor: pointer;background-color: #00FF00; text-shadow: 2px 2px #33FF33"><a
									href="../">Trang Chủ</a> </span>
							<a id="link" href="https://www.facebook.com/"><img alt="icon"
									src="../Library/Img/icon_fb.png" style="height: 30px;width: 30px" /></a>
							<a id="link" href="https://www.google.com/"><img alt="icon"
									src="../Library/Img/icongoogle.jpg" style="height: 30px;width: 30px" /></a>
						</div>
					</nav>
					<h1 style="color:#3300FF">Tài khoản Thời Trang</h1>
					<!-- <form action="" method="post"> -->
					<input id="email" class="material-textinput input-icon-email" name="email" type="text"
						placeholder="Nhập vào email..." />
					<br>
					<input id="matkhau" class="material-textinput input-icon-password" name="matkhau" type="password"
						placeholder="Mật khẩu..." />
					<br>
					<input id="btndangnhap" type="submit" class="material-textinput" value="Login" id="acpt"
						style="box-shadow:2px 2px 2px #000;width: 40%">
					<form action="post">
						<span>Bạn chưa có tài khoản? <a href="#" id="dangky">Đăng ký</a> ngay.</span>

					</form>
					<span id="ketqua"></span>
					<!-- </form> -->
				</div>

				<div class="container-signup-form" id="container-login-right">
					<nav>
						<div>
							<span
								style="color:#3300FF;cursor: pointer;background-color: #00FF00; text-shadow: 2px 2px #33FF33"><a
									href="../">Trang Chủ</a> </span>
							<a id="link" href="facebook.com"><img alt="icon" src="../Library/Img/icon_fb.png"
									style="height: 30px;width: 30px" /></a>
							<a id="link" href="google.com"><img alt="icon" src="../Library/Img/icongoogle.jpg"
									style="height: 30px;width: 30px" /></a>
						</div>
					</nav>
					<h1 style="color:#3300FF">Tài khoản Thời Trang</h1>
					<form action="" method="post">
						<input id="email" class="material-textinput input-icon-email" name="email" type="text"
							placeholder="Nhập vào email..." />
						<br>
						<input id="matkhau" class="material-textinput input-icon-password" name="matkhau"
							type="password" placeholder="Mật khẩu..." />
						<br>
						<input id="nhaplaimatkhau" class="material-textinput input-icon-password" name="nhaplaimatkhau"
							type="password" placeholder="Nhập lại mật khẩu..." />
						<br>
						<input id="btndangnhap" type="submit" class="material-textinput" value="Register" id="acpt"
							style="box-shadow:2px 2px 2px #000;width: 40%"><br>
						<span>Bạn đã nhớ tài khoản? <a href="#" id="dangnhap">Đăng Nhập</a></span>
					</form>
				</div>
				<span id="ketqua"></span>

				<span>${kiemtradangnhap}</span>
			</div>




</body>
<jsp:include page="footer.jsp" />

</html>
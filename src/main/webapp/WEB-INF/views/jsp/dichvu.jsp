<%@page import="java.util.List"%>
<%@page import="com.tuan.Entity.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Dịch Vụ</title>
	<jsp:include page="header.jsp"></jsp:include>
</head>

<body>
	<div class="container-fluid" style="background-color:black">
		<nav class="navbar navbar-default none_nav">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<span class="navbar-brand" style="color: #0000CC !important;font-weight: bold">ThoiTrangShop</span>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-center" style="color:white">
						<li class="active"><a href="../thoitrangshop" style="color:white !important">TRANG CHỦ <span
									class="sr-only">(current)</span></a></li>
					<li class="dropdown">
							<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false" style="color:white !important">Sản Phẩm<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="value" items="${danhmuc }">
									
										<li><a href="#">${value.getTendanhmuc() }</a>
											<li role="separator" class="divider"></li>	
									</c:forEach>
								</ul>
						</li>
						<li><a href="/thoitrangshop/dichvu" style="color:white !important">DỊCH VỤ</a></li>
						<li><a href="/thoitrangshop/lienhe" style="color:white !important">LIÊN HỆ</a></li>
					</ul>
					<form class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Search</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${FirstChar !=null }">
								<li><a href="dangnhap/"><span>${FirstChar}</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="container-signup-form a"><a href="dangnhap/"
										style="color:white !important">Đăng Nhập</a></li>
							</c:otherwise>
						</c:choose>
					 <li id="giohang">
						 <a href="/thoitrangshop/giohang"><img  src='<c:url value="/Library/Img/images.png"/>' height="20px" width="20px" />
								 <span></span>
							<c:if test="${soluongsanphamgiohang > 0}">
								<div class="circle-giohang"><span style="color:white !important;padding-left: 5px">${soluongsanphamgiohang }</span></div>
							</c:if>
							<c:if test="${soluongsanphamgiohang <= 0 || soluongsanphamgiohang	==	null}">
								<div><span style="color:white !important;padding-left: 5px">${soluongsanphamgiohang }</span></div>
							</c:if> 
							</a>
						</li>
						<li><a id="link" href="https://www.facebook.com/"><img 
									src='<c:url value="/Library/Img/icon_fb.png"/>' height="20px" width="20px" /></a>
						</li>
						<li><a id="link" href="https://www.google.com/"><img 
									src='<c:url value="/Library/Img/icongoogle.jpg"/>' height="20px" width="20px" /></a>
						</li>
						
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
	</div>

	<hr style="size:5px">
	<!-- Dịch vụ -->
	<div class="container">
		<div class="row">
			<div class="col-sm-2 col-md-2">
				<h3>Thông Tin Hướng Dẫn</h3>
				<ul style="cursor: pointer;">
					<!-- <li><a href="/hdmuahang">Hướng dẫn mua hàng</a></li> -->
					<li><a id="csdoitra">Chính Sách Đổi Trả Hàng</a></li>
					<li><a id="phigh">Phí giao hàng</a></li>
					<li><a id="csbaomat">Chính sách bảo mật</a></li>
					<li><a id="thanhtoan">Thanh toán chuyển khoản</a></li>
					<li><a id="lienhemua">Liên hệ mua sỉ</a></li>
					<li><a id="tuyendung">Tuyển Dụng</a></li>
					<li><a id="dangkyctv">Đăng Ký & Đặt hàng dành cho CTV</a></li>
				</ul>
			</div>
			<div class="col-sm-10 col-md-10">
				<div class=".csdoitra">
					<h4 class="titledichvu"><strong>Chính Sách Đổi Trả Hàng</strong></h4><br>
					<span><strong>Điều kiện đổi/trả hàng: trong vòng 30 ngày kể từ ngày nhận hàng nếu hàng bị lỗi, mặc không vừa, đổi sang màu khác, mẫu khác. Sản phẩm đổi/trả phải còn nguyên tình trạng ban đầu, đầy đủ phụ kiện đi kèm, và còn nguyên tem mác của Thời Trang Shop</strong></span><br>
					<p><strong>1. Đối với khách hàng tại TP. Hồ Chí Minh</strong></p>
					<p>Khách hàng có thể đến trực tiếp địa chỉ văn phòng để được đổi/trả sản phẩm: Hà Nội
     				  Điện thoại: xxxxx</p>
     				<p><strong>2. Đối với khách hàng toàn quốc.</strong></p>
     				<p>Sau khi khách hàng nhận sản phẩm và thanh toán tiền hàng, nếu quý khách có nhu cầu đổi trả hàng, quý khách vui lòng ra bưu điện gần nhất để gửi lại sản phẩm cho Thời Trang Tích Tắc theo địa chỉ văn phòng phía trên. Thời Trang Tích Shop sẽ liên hệ và chuyển hàng lại cho quý khách ngay khi nhận được sản phẩm. Nếu quý khách muốn trả hàng nhận lại tiền, chúng tôi sẽ chuyển khoản lại cho quý khách, thời gian chuyển từ 2 đến 6 ngày làm việc sau khi nhận được hàng trả. </p> 
     				<p><strong>3. Các sản phẩm không nhận đổi trả.</strong></p>
     				<p>Các sản phẩm đồ lót, đồ GEN, sản phẩm SaleOff tại cửa hàng sẽ không nhận đổi trả.

  					 Các sản phẩm giảm giá trên website sẽ áp dụng chính sách đổi hàng, không áp dụng chính sách trả hàng.</p>
				</div>
				<div class=".phigh">
					<h4 class="titledichvu"><strong>Phí giao hàng</strong></h4><br>
					<table>
						<thead><tr>Phí</tr></thead>
						<tbody>
							<td>﻿Phí giao hàng phụ thuộc vào khối lượng đơn hàng và hình thức gửi (gửi nhanh, gửi thường).<br>
								Phí tham khảo:<br>
								* 1 áo sơ mi: gửi thường 22.000đ, gửi nhanh 37.000đ<br>
								* 2 áo sơ mi: gửi thường 30.000đ, gửi nhanh 55.000đ<br>
								* 3 áo sơ mi: gửi thường 35.000đ, gửi nhanh 65.000đ<br>
								thêm 1 áo:                      +5.000đ                +10.000đ<br>
								<br>
								* 1 áo khoác: gửi thường 27.000đ, gửi nhanh 50.000đ<br>
								* 2 áo khoác: gửi thường 35.000đ, gửi nhanh 65.000đ<br>
								* 3 áo khoác: gửi thường 40.000đ, gửi nhanh 75.000đ<br>
								thêm 1 áo:                      +5.000đ                +10.000đ<br>
								<br>
								Đơn hàng từ 500.000đ: miễn phí gửi thường, hỗ trợ 50% phí gửi nhanh.
							</td>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer" class="container-fluid">
		<div class="row">
			<div class="col-md-4 wow tada">
				<center>
					<p><span class="title-footer">THÔNG TIN SHOP</span></p>
					<span style="font-size:23px">Thời trang shop là một thương hiệu lớn và uy tín</span>
				</center>
			</div>
			<div class="col-md-4 wow tada">
				<center>
					<p><span class="titlel-footer " style="font-size:32px">LIÊN HỆ</span></p>
					<span style="font-size:23px"> Việt Nam</span><br>
					<span style="font-size:23px">@gmail.com</span><br>
					<span style="font-size:23px">Phone:xxxxxxxxx</span>
				</center>
			</div>
			<div class="col-md-4 wow tada">
				<center>
					<p><span class="titlel-footer" style="font-size:32px">GÓP Ý</span></p>
					<form action="" method="post">
						<input name="tenNhanVien" style="margin-bottom: 8px;width:100%; color:black;" type="text"
							placeholder="Email" />
						<textarea name="tuoi" style="width: 100%; color: black;" rows="4"
							placeholder="Nội dung"></textarea>
						<button style="width:100%">Gửi</button>
					</form>
				</center>
			</div>
		</div>
	</div>

</body>
<jsp:include page="footer.jsp" />


</html>


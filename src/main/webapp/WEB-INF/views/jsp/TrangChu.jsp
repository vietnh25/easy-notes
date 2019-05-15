<%@page import="java.util.List"%>
<%@page import="com.tuan.Entity.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Trang chủ</title>
	<jsp:include page="header.jsp"></jsp:include>
</head>

<body>
	<div id="header" class="container-fluid">
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
					<ul class="nav navbar-nav navbar-center">
						<li class="active"><a href="../thoitrangshop" style="color:white !important">TRANG CHỦ <span
									class="sr-only">(current)</span></a></li>
						<li class="dropdown">
							<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false" style="color:white !important">Sản Phẩm<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="value" items="${danhmuc }">
									
										<li><a href="sanpham/${value.getMadanhmuc()}/${value.getTendanhmuc() } ">${value.getTendanhmuc() }</a>
											<li role="separator" class="divider"></li>	
									</c:forEach>
								</ul>
						</li>
						<li><a href="../thoitrangshop/dichvu" style="color:white !important">DỊCH VỤ</a></li>
						<li><a href="../thoitrangshop/lienhe" style="color:white !important">LIÊN HỆ</a></li>
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
						<!--  <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                        </ul>
                      </li> -->
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>

		<div class="event_header container wow bounceInLeft">
			<span>Ngày 2/4 - 6/9/2019</span>
			<br>
			<span style="font-size: 50px;">Mua một tặng một</span>
			<br>
			<button>Xem Ngay</button>
		</div>
	</div>
	<div id="info" class="container-fluid">
		<div class="row">
			<div class="col-12 col-md-4 col-lg-4 wow flipInX" data-wow-duration="1s">
				<!-- <576px chiếm 12 cột || >=576 col-se- || >=768 col-md 4 cột|| >=992 col-lg-4 || >=1200 col-xl- -->
				<img class="icon" alt="iconChatluong" src='<c:url value="/Library/Img/icon-hieu qua.png"/>' /><br>
				<span style="font-size:32px; font-weight:500">CHẤT LƯỢNG</span><br>
				<span>Chúng tôi cam kết mang đến cho bạn chất lượng tốt nhất</span>
			</div>
			<div class="col-12 col-md-4 col-lg-4 wow flipInX" data-wow-duration="1s" data-wow-delay="0.8s">
				<img class="icon" alt="iconChatluong" src='<c:url value="/Library/Img/icontietkiem.jpg"/>' /><br>
				<span style="font-size:32px; font-weight:500">TIẾT KIỆM CHI PHÍ</span><br>
				<span>Cam kết giá rẻ nhất</span>
			</div>
			<div class="col-12 col-md-4 col-lg-4 wow flipInX" data-wow-duration="1s" data-wow-delay="1.3s">
				<img class="icon" alt="iconChatluong" src='<c:url value="/Library/Img/icongiaohang.png"/>' /><br>
				<span style="font-size:32px; font-weight:500">GIAO HÀNG</span><br>
				<span>Giao hàng nhanh và chuẩn</span>
			</div>
		</div>

	</div>
	<hr style="size:5px">
	<div id="title-sanpham">
		<span>SẢN PHẨM HOT</span>
		<div class="row" style="margin-top:42px">
			<!-- duyệt lis sản phẩm mbiến var sẽ đại diện cho từng sản phẩm trong list-->
			<c:forEach var="sanpham" items="${listSanPhams}">
				<a href="chitiet/${sanpham.getMasanpham() }" id="sanphamclick"> 
				<div class="col-md-3 col-sm-6" style="cursor:pointer">
					<div class="sanpham wow jackInTheBox">
						<img class="hinh" alt="hinh"
							src='<c:url value="/Library/Img/sanpham/${sanpham.getHinhsanpham()}"/>' /><br>
						<span><a href="chitiet/${sanpham.getMasanpham() }">${sanpham.getTensanpham()}</a></span><br>
						<span class="price">${sanpham.getGiatien() }VNĐ</span>
					</div>
				</div>
				</a>
			</c:forEach>

			<%-- <div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/><br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div>
				
				<div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/><br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div>
				<<div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/> <br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div>
				<div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/> <br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div>
				<div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/> <br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div>
				<div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/> <br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div>			
				<div class="col-md-3 sanpham wow jackInTheBox">
					<img class="hinh" alt="hinh" src='<c:url value="/Library/Img/sanpham1.jpg"/>'/> <br>
					<span>Áo thun</span><br>
					<span class="price">150.000VNĐ</span>
				</div> --%>
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


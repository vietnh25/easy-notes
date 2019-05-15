<%@page import="java.util.List"%>
<%@page import="com.tuan.Entity.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Giỏ Hàng</title>
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
						<li class="active"><a href="/thoitrangshop" style="color:white !important">TRANG CHỦ <span
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
						<!-- hoặc dùng if else
							<c:choose>
							    <c:when test="${param.enter=='1'}">
							        pizza. 
							        <br />
							    </c:when>    
							    <c:otherwise>
							        pizzas. 
							        <br /> 
							    </c:otherwise>
							</c:choose>
						 -->
						 <li id="giohang">
						 <a href="#"><img  src='<c:url value="/Library/Img/images.png"/>' height="20px" width="20px" />
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
	</div>

	<hr style="size:5px">
	<!-- body Chi tiết sản phẩm -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<h3>Danh Sách Sản Phẩm Trong Giỏ Hàng</h3>
				<table class="table">
					<thead>
						<tr>
							<td><h5>Tên sản phẩm</h5></td>
							<td><h5>Màu sản phẩm</h5></td>
							<td><h5>Size</h5></td>
							<td><h5>Số lượng</h5></td>
						</tr>
					</thead>
					
					<tbody>
					
						<c:forEach var="value" items="${gioHangs}">
								<tr data-chitiet="${value.getMachitiet() }">	
										
										<td class="tensp" id="tensp" data-sp="${value.getMasp() }">${value.getTensp() }</td>
										<td class="mau" data-mamau="${value.getMamau() }">${value.getTenmau() }</td><!-- cột -->
										<td class="size" data-size="${value.getMasize() }">${value.getTensize() }</td>
										<td class="soluong"><input class="soluong-giohang" type="number"  min="1" value="${value.getSoluong() }"/></td>	
										<td data-value="${value.getGiatien()}" class="giatien">${value.getGiatien() } </td>	
										<td class="xoa-giohang btn btn-danger">Xóa</td>
								</tr>
						</c:forEach>
						
					</tbody>
				</table> 
				<h4>Tổng Tiền:<span style="color:red;" id="tongtien"></span></h4>
			</div>
			<div class="col-md-6 col-sm-12">
				<h3>Thông Tin Người Nhận Người Mua</h3>
				
				<div class="form-group">
					<form action="" method="post">
						<label for="tennguoimua">Tên Người Mua</label>
						<input class="form-control" id="tenkhachhang" name="tenkhachhang"/>
						
						<label for="dienthoailienlac">Điện Thoại Liên Lạc</label>
						<input class="form-control" id="sodt" name="sodt"/>
												
						<div class="checkbox">
							  <label><input type="radio" value="Giao Hàng Tận Nơi" name="hinhthucgiaohang">Giao Hàng Tận Nơi</label>
							
							</div>
							<div class="checkbox">
							 <label><input type="radio" value="Nhận Hàng Tại Cửa Hàng" name="hinhthucgiaohang">Nhận Hàng Tại Cửa Hàng</label>
							 </div>
							
							
	
						<label for="diachi">Địa Chỉ Nhận Hàng</label>
							<input class="form-control" id="diachigiaohang" name="diachigiaohang" />
						
						< <label for="ghichu">Ghi Chú</label>
	 						 <textarea class="form-control" rows="5" id="ghichu" name="ghichu"></textarea>
	 						 
	 					<input type="submit" class="btn btn-primary" value="Đặt Hàng"/>
 					 </form>
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


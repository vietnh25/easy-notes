$(document).ready(function(){ 
	$("#col1").click(function(){
		$(this).addClass("activeLink")
	});
	$("#col1").click(function(){
		var chuoi = $("#col1").attr("data-text");
		alert(chuoi);	
	});
	
	$("#btndangnhap").click(function(){
		var ten = $("#email").val();
		var password = $("#matkhau").val();
		$.ajax({
			  url:"/thoitrang/api/KiemTraDangNhap",
			  type:"GET",
			  data:{
				  email:ten,
				  matkhau:password,
			  },
			  success: function(value) {
				if(value == "true"){
					duongDanHienTai = window.location.href;
					duongDan = duongDanHienTai.replace("dangnhap/","");
					window.location = duongDan;
					$("#ketqua").text("đăng nhập thành công");
				}else{
					$("#ketqua").text("đăng nhập thất bại");
				}
			}
			});
	});
	
	$("#dangnhap").click(function(){
		$(".container-login-form").show();
		$(".container-signup-form").css("display","none");
	});
	
	$("#dangky").click(function(){
		$(".container-login-form").css("display","none");
		$(".container-signup-form").show();
	});
	
	$("#sanphamclick").click(function() {
		var hidelink = $("#sanphamclick");
	});
	
	/*các sự kiện sau không thể dùng click*/
	$("body").on("click","#csdoitra",function(){
		$(".csdoitra").show();
		$(".phigh").css("display","none");
	});
	
	$("body").on("click","#phigh",function(){
		$(".phigh").show();
		$(".csdoitra").css("display","none");	
	});
	
	$("body").on("click",".paging-item",function(){
		
		$(".paging-item").removeClass("active");
		$(this).addClass("active");
		var sotrang = $(this).text();
		var spbatdau = (sotrang -1)  * 5; 
		$.ajax({
			  url:"/thoitrang/api/LaySanPhamLimit",
			  type:"GET",
			  data:{
				  spbatdau:spbatdau
			  },
			  success: function(value) { 
				 /*value đại diện cho html trong Api*/
				var tbodysanpham =  $("#table-sanpham").find("tbody");
				tbodysanpham.empty(); 
				tbodysanpham.append(value);
			  }
	});
	});
/*	$("#xoa-sanpham").click(function()*/
	$("body").on("click","#xoa-sanpham",function(){												
		
		});
	});
	
	$("#checkall").change(function(){
		if(this.checked){
			$("#table-sanpham input").each(function(){
				$(this).attr("checked","checked");
				
			});
		}
	});
	
	$(".btngiohang").click(function(){
		
	    var	machitiet = $(this).attr("data-machitiet");
		var masp  =  $("#tensp").attr("data-masp");
		var tensp =  $("#tensp").text();
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau");
		var tenmau = $(this).closest("tr").find(".mau").text();
		var masize = $(this).closest("tr").find(".size").attr("data-size");
		var tensize = $(this).closest("tr").find(".size").text();
		var giatien = $("#giatien").attr("data-giatien");
		var soluong = $(this).closest("tr").find(".soluong").attr("data-soluong");
		
	
		$.ajax({
			  url:"/thoitrang/api/ThemGioHang",
			  type:"GET",
			  data:{
				 masp:masp,
				 masize:masize,
				 mamau:mamau,
				 tensp:tensp,
				 giatien:giatien,
				 tenmau:tenmau,
				 tensize:tensize,
				 soluong:soluong,
				 machitiet:machitiet
			  },
			  success: function(value) {
				 /* Cách2*/
				  /*$("#giohang").find("div").addClass("circle-giohang");
					 $("#giohang").find("div").html(value);*/
			}/*khi ajax  chạy xong ta lấy lại số lượng giỏ hàng*/
			  /*cách 1*/
			}).done(function() {
				$.ajax({
					  url:"/thoitrang/api/LaySoLuongGioHang",
					  type:"GET",
					  data:{
						
					  },
					  success: function(value) {
						 $("#giohang").find("div").addClass("circle-giohang");
						 $("#giohang").find("div").html(value);
					}
			});
		});
	
	});
	/* Xóa giỏ hàng */
	$(".xoa-giohang").click(function(){
		var sefl = $(this);
		var masp  =  $(this).closest("tr").find(".tensp").attr("data-sp");
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau");
		var masize = $(this).closest("tr").find(".size").attr("data-size");
		$.ajax({
			  url:"/thoitrang/api/XoaGioHang",
			  type:"GET",
			  data:{
				 masp:masp,
				 masize:masize,
				 mamau:mamau,
			  },
			  success: function(value) {
				  sefl.closest("tr").remove(); 
				  gantongtiengiohang(true);
			  }
	})
	});
	gantongtiengiohang();
	function gantongtiengiohang(isEventChange) {
		var tongtiensp = 0;
		
		
		$(".giatien").each(function(){
			var giatien = $(this).text();
			/*var soluong = $(this).closest("tr").find(".soluong-giohang").val();*/
			
			
			
			var format = parseFloat(giatien).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
		
			if(!isEventChange){
				$(this).html(format);
			}
			 tongtiensp = tongtiensp + parseFloat(format);
			 var formattongtien = tongtiensp.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
		
			
			$("#tongtien").html(formattongtien + "");
		});
	}
	/* soluong với giá tiền */
	$(".soluong-giohang").change(function(){
		var soluong = $(this).val();
		var giatien = $(this).closest("tr").find(".giatien").attr("data-value");
		
		var tongtien = soluong * parseInt(giatien);
		
		
		var format = tongtien.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
		$(this).closest("tr").find(".giatien").html(format);
		
		gantongtiengiohang(true);
		
		var soluong = $(this).val();
		var masp  =  $(this).closest("tr").find(".tensp").attr("data-sp");
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau");
		var masize = $(this).closest("tr").find(".size").attr("data-size");
		$.ajax({
			  url:"/thoitrang/api/CapNhatGioHang",
			  type:"GET",
			  data:{
				 masp:masp,
				 masize:masize,
				 mamau:mamau,
				 soluong:soluong
			  },
			  success: function(value) {
				
			}
		});
	});
	$('#checkall').change(function() {
	    var checkboxes = $(this).closest('tbody').find(':checkbox');
	    checkboxes.prop('checked', $(this).is(':checked'));
	});
	$('#xoa-sanpham').click(function(){
		$("#table-sanpham input:checked").each(function(){
			var masp= $(this).val();
			masp = parseInt(masp);
			var This =$(this);
			$.ajax({
				  url:"/thoitrang/api/XoaSanPham",
				  type:"GET",
				  data:{
					 masp:masp	
				  },
				  success: function(value) {
					This.closest("tr").remove();
				}
			});
	})
	var files =[];
	$("#hinhanh").change(function(event){
		files = event.target.files;
		/*tạo form jquery*/
		forms = new formData();
		
		forms.append("file",files[0]);
		
		$.ajax({
			  url:"/thoitrang/api/UpLoadFile",
			  type:"POST",
			  data:forms,
			  contentType:false,
			  /*xử lí dữ liệu thẻ form*/
			  processData:false,
			  enctype:"multipart/form-data",
			  success: function(value) {
				
			}
		});
	})
	/*end*/
})


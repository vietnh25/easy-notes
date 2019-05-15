package com.tuan.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tuan.Entity.DanhMucSanPham;
import com.tuan.Entity.GioHang;
import com.tuan.Entity.SanPham;
import com.tuan.Service.ChiTietHoaDonService;
import com.tuan.Service.DanhMucService;
import com.tuan.Service.SanPhamService;

@Controller
@RequestMapping("/sanpham")
public class SanPhamController {
	@Autowired
	DanhMucService danhmucService;
	
	@Autowired
	SanPhamService sanphamService;
	
	@Autowired
	ChiTietHoaDonService chitiethoadonService;
	@GetMapping("{id}/{tendanhmuc}")
	public String Default(ModelMap modelMap,@PathVariable int id,@PathVariable String tendanhmuc) {
		List<SanPham> listSanPham = sanphamService.laySanPhamTheoMaDanhMuc(id);
		modelMap.addAttribute("tendanhmuc", tendanhmuc);
		modelMap.addAttribute("listSanPham", listSanPham);
		List<DanhMucSanPham> danhMucSanPhams = danhmucService.layDanhMuc();
		modelMap.addAttribute("danhmuc", danhMucSanPhams);
		return "sanpham";
	}
	@GetMapping("../{id}")
	public String ChiTiet(@PathVariable int id,ModelMap modelMap) {
		List<SanPham> listSanPham = sanphamService.laySanPhamTheoMaDanhMuc(id);
		modelMap.addAttribute("listSanPham", listSanPham);
		return "chitiet";
	}

	@GetMapping("/{masanpham}")// xoá bỏ mã sản phẩm khỏi miền
	public String Default(@PathVariable int masanpham,ModelMap modelMap,HttpSession httpSession) {
			SanPham sanPhams =  sanphamService.layDanhSachChiTietSanPhamTheoMa(masanpham);
			modelMap.addAttribute("sanPhams", sanPhams);
			
			List<DanhMucSanPham> danhMucSanPhams = danhmucService.layDanhMuc();
			modelMap.addAttribute("danhmuc", danhMucSanPhams);
			
			if(null != httpSession.getAttribute("giohang")) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				modelMap.addAttribute("soluongsanphamgiohang",gioHangs.size());
			}
			
			
		return "chitiet";
}
}
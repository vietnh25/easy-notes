package com.tuan.Controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tuan.Entity.DanhMucSanPham;
import com.tuan.Entity.GioHang;
import com.tuan.Entity.SanPham;
import com.tuan.Service.DanhMucService;
import com.tuan.Service.SanPhamService;

@Controller
@RequestMapping("/chitiet")
@SessionAttributes("giohang")
public class ChiTietController {
@Autowired	
SanPhamService sanphamService;

@Autowired
DanhMucService danhmucService;
	
	
	@GetMapping("/{masanpham}")
	public String Default(@PathVariable int masanpham,ModelMap modelMap,HttpSession httpSession) {
			SanPham sanPhams =  sanphamService.layDanhSachChiTietSanPhamTheoMa(masanpham);
			modelMap.addAttribute("sanPhams", sanPhams);
			
		
			
			if(null != httpSession.getAttribute("giohang")) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				modelMap.addAttribute("soluongsanphamgiohang",gioHangs.size());
			}
			
			
		return "chitiet";
		
		}
	
	@GetMapping
	public String Default(ModelMap modelMap,HttpSession httpSession) {
		List<DanhMucSanPham> danhMucSanPhams = danhmucService.layDanhMuc();
		modelMap.addAttribute("danhmucs", danhMucSanPhams);
		
		return "sanpham";
	}
	
	
	@GetMapping("/thoitrangshop")
	public String TrangChu() {
		return "trangchu";
	}
	@GetMapping("/chitiet")
	public String ChiTiet() {
		return "chitiet";
	}
}

	


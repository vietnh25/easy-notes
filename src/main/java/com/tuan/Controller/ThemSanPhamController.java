package com.tuan.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tuan.Entity.DanhMucSanPham;
import com.tuan.Entity.MauSanPham;
import com.tuan.Entity.SanPham;
import com.tuan.Entity.SizeSanPham;
import com.tuan.Service.DanhMucService;
import com.tuan.Service.MauSanPhamService;
import com.tuan.Service.SanPhamService;
import com.tuan.Service.SizeSanPhamService;

@Controller
@RequestMapping("/themsanpham")
public class ThemSanPhamController {
	@Autowired
	SanPhamService sanphamService;
	
	@Autowired
	DanhMucService danhmucService;
	
	@Autowired
	SizeSanPhamService sizesanphamService;
	
	@Autowired
	MauSanPhamService mausanphamService;
	@GetMapping
	public String Default(ModelMap modelMap) {
		List<SanPham> listSanPham = sanphamService.layDanhSachSanPhamLimit(0);
		List<SanPham> allSanPham = sanphamService.layDanhSachSanPhamLimit(-1);

		double tongsopage =Math.ceil((double) allSanPham.size() / 5);
		modelMap.addAttribute("allSanPham", allSanPham);
		modelMap.addAttribute("listSanPham", listSanPham);
		modelMap.addAttribute("tongsopage", tongsopage);
		
		//  java Math.floor
		List<DanhMucSanPham> danhMucSanPhams = danhmucService.layDanhMuc();
		modelMap.addAttribute("danhmucs", danhMucSanPhams);
		
		List<SizeSanPham> sizeSanPhams = sizesanphamService.LayDanhSachSize();
		modelMap.addAttribute("sizeSanPhams", sizeSanPhams);
		
		List<MauSanPham> mauSanPhams = mausanphamService.LayDanhSachMauSanPham();
		modelMap.addAttribute("mauSanPhams", mauSanPhams);
		return "themsanpham";
	}
}

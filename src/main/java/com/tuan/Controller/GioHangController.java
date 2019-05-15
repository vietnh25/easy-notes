package com.tuan.Controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuan.Entity.ChiTietHoaDon;
import com.tuan.Entity.ChiTietHoaDonId;
import com.tuan.Entity.GioHang;
import com.tuan.Entity.HoaDon;
import com.tuan.Service.ChiTietHoaDonService;
import com.tuan.Service.HoaDonService;

@Controller
@RequestMapping("/giohang")
public class GioHangController {
	
	@GetMapping
	public String Default(HttpSession httpSession ,ModelMap modelMap) {
		
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			modelMap.addAttribute("soluongsanphamgiohang",gioHangs.size());
			modelMap.addAttribute("gioHangs",gioHangs);
		}
		
		return "giohang";
	}
	
	@GetMapping("/thoitrangshop")
	public String TrangChu() {
		
		return "trangchu";
	}
	@Autowired
	HoaDonService hoadonService;
	
	@Autowired
	ChiTietHoaDonService chitiethoadonService;
	@PostMapping
	public String ThemHoaDon(HttpSession httpSession,@RequestParam String tenkhachhang,@RequestParam String	sodt,@RequestParam	String diachigiaohang,
			@RequestParam	String hinhthucgiaohang,@RequestParam String ghichu) {
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			HoaDon hoaDon = new HoaDon();
			hoaDon.setTenkhachhang(tenkhachhang);
			hoaDon.setSodt(sodt);
			hoaDon.setDiachigiaohang(diachigiaohang);
			hoaDon.setHinhthucgiaohang(hinhthucgiaohang);
			hoaDon.setGhichu(ghichu);
			
			
			int idHoaDon=hoadonService.ThemHoaDon(hoaDon);
			if(idHoaDon>0) {
				
				
				java.util.Set<ChiTietHoaDon> listchiTietHoaDon = new HashSet<ChiTietHoaDon>();
				
				for (GioHang gioHang : gioHangs) {
					ChiTietHoaDonId chiTietHoaDonId = new ChiTietHoaDonId();
					chiTietHoaDonId.setMachitietsanpham(gioHang.getMachitiet());
					chiTietHoaDonId.setMahoadon(hoaDon.getMahoadon());
					
					ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
					chiTietHoaDon.setChiTietHoaDonId(chiTietHoaDonId);
					chiTietHoaDon.setGiatien(gioHang.getGiatien().toString());
					chiTietHoaDon.setSoluong(gioHang.getSoluong());
					
				
					chitiethoadonService.ThemChiTietHoaDon(chiTietHoaDon);
				}
				hoaDon.setDanhsachchitiethoadon(listchiTietHoaDon);
			
			}else {
				System.out.println("thêm thất bại");
			}
					
		
	}
		return "giohang";
	
  }
}
package com.tuan.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.hibernate.integrator.spi.Integrator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tuan.Entity.GioHang;
import com.tuan.Entity.SanPham;
import com.tuan.Service.NhanVienService;
import com.tuan.Service.SanPhamService;

@Controller
@RequestMapping("api/")
@SessionAttributes({"email","giohang"})

public class ApiController {
	@Autowired
	NhanVienService nhanVienService;
	

	List<GioHang> listGioHang = new ArrayList<GioHang>();
	
	@GetMapping("KiemTraDangNhap")
	@ResponseBody
	@Transactional
	public String KiemTraDangNhap(@RequestParam String email,@RequestParam String matkhau, ModelMap modelMap) {
		
		boolean kiemtra =  nhanVienService.KiemTraDangNhap(email,matkhau);
		if(kiemtra == true) {
			modelMap.addAttribute("kiemtradangnhap", "Đăng nhập thành công !");
		}else {		
			modelMap.addAttribute("kiemtradangnhap", "Đăng nhập thất bại !");
		}
		modelMap.addAttribute("email",email);
		System.out.println("" +email);
		return ""+kiemtra;
	}
    @GetMapping("ThemGioHang")
	@ResponseBody
	public void ThemGioHang(@RequestParam int masp,@RequestParam int masize,@RequestParam int mamau,@RequestParam String tensp,@RequestParam String giatien,@RequestParam String tenmau,@RequestParam String tensize,@RequestParam int soluong,@RequestParam int machitiet,HttpSession httpSession) {
	
		if(null == httpSession.getAttribute("giohang")) {
		List<GioHang>  gioHangs = new ArrayList<GioHang>();
		GioHang gioHang = new GioHang();
		gioHang.setMasp(masp);
		gioHang.setMasize(masize);
		gioHang.setTensp(tensp);
		gioHang.setTenmau(tenmau);
		gioHang.setGiatien(giatien);
		gioHang.setMamau(mamau);
		gioHang.setSoluong(1);
		gioHang.setTensize(tensize);
		gioHang.setMachitiet(machitiet);
		gioHangs.add(gioHang);
		
		httpSession.setAttribute("giohang", gioHangs);
		
		List<GioHang> list = (List<GioHang>) httpSession.getAttribute("giohang");
		System.out.println(list.size());
		
			
	}else {
		
		List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
		int vitri = KiemTraSanPhamDaTonTai(listGioHang,masp, masize, mamau, httpSession);
		if(vitri == -1)
		{
			GioHang gioHang = new GioHang();
			gioHang.setMasp(masp);
			gioHang.setMasize(masize);
			gioHang.setTensp(tensp);
			gioHang.setTenmau(tenmau);
			gioHang.setGiatien(giatien);
			gioHang.setMamau(mamau);
			gioHang.setSoluong(1);
			gioHang.setTensize(tensize);
			gioHang.setMachitiet(machitiet);
			
			listGioHang.add(gioHang);
		}else {
			
			
			int soluongmoi= listGioHang.get(vitri).getSoluong()	+ 1;
			listGioHang.get(vitri).setSoluong(soluongmoi);;
		}
		
	} 
	List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
	for (GioHang gioHang : listGioHang) {
		System.out.println(gioHang.getMasp()+"---"+gioHang.getTenmau()+"---"+gioHang.getTensize()+"---"+gioHang.getSoluong());
	}
}
	
	private int KiemTraSanPhamDaTonTai(List<GioHang> listGioHang, int masp,int masize,int mamau,HttpSession httpSession) {
		if(httpSession.getAttribute("giohang") !=null) {
			 listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			for(int i =0; i<listGioHang.size();i++) {
				if(listGioHang.get(i).getMasp()== masp && listGioHang.get(i).getMamau()==mamau && listGioHang.get(i).getMasize()==masize) {
				
					return i;
				}
			}
		}
		return -1;
	}
	
	@GetMapping("LaySoLuongGioHang")
	@ResponseBody
	public String LaySoLuongGioHang(HttpSession httpSession) {
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			return gioHangs.size()+"";
		}
		return "";
	}
	@GetMapping("CapNhatGioHang")
	@ResponseBody
	public void CapNhatGioHang(HttpSession httpSession,@RequestParam int soluong,@RequestParam int masp,@RequestParam int mamau,@RequestParam int masize) {
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = KiemTraSanPhamDaTonTai(listGioHang,masp, masize, mamau, httpSession); 
			listGioHang.get(vitri).setSoluong(soluong);
		}
	}
	
	
	@GetMapping("XoaGioHang")
	@ResponseBody
	public void XoaGioHang(HttpSession httpSession,@RequestParam int masp,@RequestParam int mamau,@RequestParam int masize) {
		if(null != httpSession.getAttribute("giohang")) {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = KiemTraSanPhamDaTonTai(listGioHang,masp, masize, mamau, httpSession); 
			listGioHang.remove(vitri);
		}
	}
	
	
	@Autowired 
	SanPhamService sanphamService;

	@GetMapping(path="LaySanPhamLimit",produces="text/plain; charset=utf-8") 
	@ResponseBody
	@Transactional
	public String LaySanPhamLimit(@RequestParam int spbatdau) {
		String html = "";
		
		List<SanPham> listsanPham = sanphamService.layDanhSachSanPhamLimit(spbatdau);
		for (SanPham sanPham : listsanPham) {
			html += "<tr>";
			html += "<td> <div class='checkbox'><label><input class='checkboxsanpham' type='checkbox' value=''>Option 1</label></div></td>";
			html+="	<td class='tensp' data-sp='" +sanPham.getMasanpham()+"' >" +sanPham.getTensanpham()+" </td>";
			html+=	"<td  class='giatien'>"+sanPham.getGiatien() +"</td>";	
			html+= "<td class='gianhcho' >"+ sanPham.getGianhcho() +" </td>";
		
			html += "</tr>";
			
		}
		
		return html;
		
	}
	@GetMapping("XoaSanPham")
	@ResponseBody
	@Transactional
	public String XoaSanPhamTheoMaSanPham(@RequestParam int masp) {
		System.out.println("masp : " +masp);
		sanphamService.XoaSanPhamTheoMaSanPham(masp);
		return "true";
	}
	@Autowired
	ServletContext servletContext;
	
	@PostMapping("UpLoadFile")
	@ResponseBody
	@Transactional
	public String UpLoadFile(@RequestParam MultipartHttpServletRequest httpServletRequest) {
		String path_save_file = servletContext.getRealPath("/Library/Img/sanpham");
		
		Iterator<String> listNames= httpServletRequest.getFileNames();
		
		MultipartFile file = httpServletRequest.getFile(listNames.next());
		
		
		File file_save= new File(path_save_file + file.getOriginalFilename());
		 try {
			file.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "true";
	}
}

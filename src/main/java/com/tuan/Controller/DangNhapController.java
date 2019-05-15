package com.tuan.Controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tuan.Entity.NhanVien;
import com.tuan.Service.NhanVienService;

@Controller
@RequestMapping("dangnhap/")
@SessionAttributes("email")
public class DangNhapController {


	@Autowired
	NhanVienService nhanVienService;
	@GetMapping


	public String KiemTraDangNhap()
	{
		
		/*if(httpSession.getAttribute("email") != null) {
			String ten = (String) httpSession.getAttribute("email");
			String FirstChar = ten.toString();
			System.out.println(FirstChar);
			modelMap.addAttribute("FirstChar",FirstChar);
		}*/
		
		return "dangnhap";
	}

	@PostMapping
	public String DangKy(@RequestParam String email,@RequestParam String matkhau,@RequestParam String nhaplaimatkhau,ModelMap modelMap) {
		boolean ktraemail = validate(email);
		if(ktraemail) {
			if(matkhau.equals(nhaplaimatkhau)) {
				NhanVien nhanVien = new NhanVien();
				nhanVien.setEmail(email);
				nhanVien.setTendangnhap(email);
				nhanVien.setMatkhau(matkhau);		
				
				// thêm nhân viên từ service
			boolean ktThem =nhanVienService.ThemNhanVien(nhanVien);
			if(ktThem== true) {
				 modelMap.addAttribute("kiemtradangnhap", "Tạo tài khoản thành công");
			}else {
				modelMap.addAttribute("kiemtradangnhap", "Tạo tài khoản thất bại");
			}
		 }else {
			 modelMap.addAttribute("kiemtradangnhap", "Mật Khẩu không trùng khớp");
		 }
				
		}else {
			modelMap.addAttribute("kiemtradangnhap", "Vui lòng nhập đúng định dạng email");
		}
		return "dangnhap";
	}

   
  
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[a-zA-Z0-9_+&*-]+(?:\\."+ 
            "[a-zA-Z0-9_+&*-]+)*@" + 
            "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
            "A-Z]{2,7}$",Pattern.CASE_INSENSITIVE );
    public static boolean validate(String emailStr) {
    	Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
    	return matcher.find();
    }
	
}

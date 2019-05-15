package com.tuan.Controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuan.Service.LienHeService;

@Controller
@RequestMapping("/lienhe")
public class LienHeController {
@Autowired
LienHeService lienHeService;

@PostMapping
	public String LienHe(@RequestParam String tenkhachhang,@RequestParam String email
			,@RequestParam String tencty,@RequestParam String diachicty
			,@RequestParam String noidung,@RequestParam String sodt, ModelMap modelMap) {
	boolean ktraemail = validate(email);
	if(ktraemail) {
			 com.tuan.Entity.LienHe lienHe = new com.tuan.Entity.LienHe();
			 lienHe.setDiachicty(diachicty);
			 lienHe.setEmail(email);
			 lienHe.setNoidung(noidung);
			 lienHe.setTencty(tencty);
			 lienHe.setTenkhachhang(tenkhachhang);
			 lienHe.setSodt(sodt);
	boolean ktrathem = lienHeService.ThemLienHe(lienHe);
	if(ktrathem== true) {
		 modelMap.addAttribute("kiemtralienhe", "Thêm liên hệ thành công");
	}else {
		modelMap.addAttribute("kiemtralienhep", "Thêm liên hệ thất bại");
	}
			 
	}else{
		modelMap.addAttribute("email", "Email không dúng định dạng !");
	}
	
	return "lienhe";
}
			
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[a-zA-Z0-9_+&*-]+(?:\\."+ 
		        "[a-zA-Z0-9_+&*-]+)*@" + 
		        "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
		        "A-Z]{2,7}$",Pattern.CASE_INSENSITIVE );
	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
	@GetMapping("/giohang")
	public String GioHang() {
		return "giohang";
	}
	
}

package com.tuan.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dichvu")
public class DichVuController {

	@GetMapping("/giohang")
	public String GioHang() {
		return "giohang";
	}
} 

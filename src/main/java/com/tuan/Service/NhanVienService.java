package com.tuan.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.NhanVienDAO;
import com.tuan.Entity.NhanVien;
import com.tuan.daoimpl.NhanVienImpl;

@Service
public class NhanVienService implements NhanVienImpl {
	@Autowired
	NhanVienDAO nhanVienDAO;
	
	
	public boolean KiemTraDangNhap(String email, String matkhau) {
		boolean kiemtra = nhanVienDAO.KiemTraDangNhap(email, matkhau);
		return kiemtra;
	}


	public boolean ThemNhanVien(NhanVien nhanVien) {
		boolean ktThem = nhanVienDAO.ThemNhanVien(nhanVien);
		return ktThem;
	}
	
}

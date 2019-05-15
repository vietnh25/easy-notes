package com.tuan.daoimpl;

import com.tuan.Entity.NhanVien;

public interface NhanVienImpl {
	boolean KiemTraDangNhap(String email,String matkhau);
	boolean ThemNhanVien(NhanVien nhanVien);
}

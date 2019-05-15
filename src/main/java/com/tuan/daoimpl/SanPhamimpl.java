package com.tuan.daoimpl;

import java.util.List;

import com.tuan.Entity.SanPham;

public interface SanPhamimpl {
	//TRẢ san phẩm
	List<SanPham> layDanhSachSanPhamLimit(int spbatdau);
	
	SanPham layDanhSachChiTietSanPhamTheoMa(int masanpham);
	
	//trả list sản phẩm cho danh mục
	List<SanPham> laySanPhamTheoMaDanhMuc(int madanhmuc);
	
	boolean XoaSanPhamTheoMaSanPham(int masanpham);
}

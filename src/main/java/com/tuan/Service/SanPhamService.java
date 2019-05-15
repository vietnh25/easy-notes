package com.tuan.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.SanPhamDAO;
import com.tuan.Entity.SanPham;
import com.tuan.daoimpl.SanPhamimpl;

@Service
public class SanPhamService implements SanPhamimpl{
	@Autowired
	SanPhamDAO sanPhamDAO;
	public List<SanPham> layDanhSachSanPhamLimit(int spbatdau) {
		
		return sanPhamDAO.layDanhSachSanPhamLimit(spbatdau);
	}
	public SanPham layDanhSachChiTietSanPhamTheoMa(int masanpham) {
		
		return sanPhamDAO.layDanhSachChiTietSanPhamTheoMa(masanpham);
	}
	public List<SanPham> laySanPhamTheoMaDanhMuc(int madanhmuc) {
		// TODO Auto-generated method stub
		return sanPhamDAO.laySanPhamTheoMaDanhMuc(madanhmuc);
	}
	public boolean XoaSanPhamTheoMaSanPham(int masanpham) {
		// TODO Auto-generated method stub
		return sanPhamDAO.XoaSanPhamTheoMaSanPham(masanpham);
	}

}

package com.tuan.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.MauSanPhamDAO;
import com.tuan.Entity.MauSanPham;
import com.tuan.daoimpl.MauSanPhamImpl;

@Service
public class MauSanPhamService implements MauSanPhamImpl{

	@Autowired
	MauSanPhamDAO mauSanPhamDAO;
	public List<MauSanPham> LayDanhSachMauSanPham() {
		// TODO Auto-generated method stub
		return mauSanPhamDAO.LayDanhSachMauSanPham();
	}

}

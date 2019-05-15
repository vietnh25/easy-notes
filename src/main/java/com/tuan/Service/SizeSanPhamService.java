package com.tuan.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tuan.Dao.SizeSanPhamDAO;
import com.tuan.Entity.SizeSanPham;
import com.tuan.daoimpl.SizeSanPhamImpl;


@Repository
public class SizeSanPhamService implements SizeSanPhamImpl{
@Autowired
SizeSanPhamDAO sizeSanPhamDAO;
	public List<SizeSanPham> LayDanhSachSize() {
		// TODO Auto-generated method stub
		return sizeSanPhamDAO.LayDanhSachSize();
	}

}

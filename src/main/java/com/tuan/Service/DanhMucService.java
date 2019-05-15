package com.tuan.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.DanhMucDAO;
import com.tuan.Entity.DanhMucSanPham;
import com.tuan.daoimpl.DanhMucImpl;

@Service
public class DanhMucService implements DanhMucImpl{
@Autowired
DanhMucDAO danhMucDAO;
	public List<DanhMucSanPham> layDanhMuc() {
		
		return danhMucDAO.layDanhMuc();
	}

}

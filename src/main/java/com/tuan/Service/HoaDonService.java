package com.tuan.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.HoaDonDAO;
import com.tuan.Entity.HoaDon;
import com.tuan.daoimpl.HoaDonImpl;

@Service
public class HoaDonService implements HoaDonImpl{
@Autowired
HoaDonDAO hoaDonDAO;

public int ThemHoaDon(HoaDon hoaDon) {
	 
	return hoaDonDAO.ThemHoaDon(hoaDon);
}
}

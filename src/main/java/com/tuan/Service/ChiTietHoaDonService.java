package com.tuan.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.ChiTietHoaDonDAO;
import com.tuan.Entity.ChiTietHoaDon;
import com.tuan.daoimpl.ChiTietHoaDonImpl;


@Service
public class ChiTietHoaDonService implements ChiTietHoaDonImpl{
@Autowired
ChiTietHoaDonDAO tietHoaDonDAO;

public boolean ThemChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
	// TODO Auto-generated method stub
	return tietHoaDonDAO.ThemChiTietHoaDon(chiTietHoaDon);
}



}

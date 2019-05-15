package com.tuan.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.ChiTietHoaDon;
import com.tuan.Entity.ChiTietHoaDonId;
import com.tuan.daoimpl.ChiTietHoaDonImpl;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ChiTietHoaDonDAO implements ChiTietHoaDonImpl{
@Autowired
SessionFactory sessionFactory;

	
@Transactional	
	public boolean ThemChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		 Session session = sessionFactory.getCurrentSession();
		ChiTietHoaDonId id=  (ChiTietHoaDonId) session.save(chiTietHoaDon);
		 if(null != id) {
			 return true;
		 }else {
		return false;
	}
	}
	
}

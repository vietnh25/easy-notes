package com.tuan.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.HoaDon;
import com.tuan.daoimpl.HoaDonImpl;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)

public class HoaDonDAO implements HoaDonImpl{
@Autowired
SessionFactory sessionFactory;
	
@Transactional
	public int ThemHoaDon(HoaDon hoaDon) {
		Session session =sessionFactory.getCurrentSession();
		int id = (Integer) session.save(hoaDon);
		if(0 < id ) {
			return id;
		}else {
			return 0;
		}
	
	}

}

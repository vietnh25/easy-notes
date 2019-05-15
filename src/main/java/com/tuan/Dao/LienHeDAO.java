package com.tuan.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.LienHe;
import com.tuan.daoimpl.LienHeImpl;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)//lấy toàn bộ class
public class LienHeDAO implements LienHeImpl{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean ThemLienHe(LienHe lienHe) {
		Session session = sessionFactory.getCurrentSession();
		int malienhe = (Integer) session.save(lienHe);
		if(malienhe >0) {
			return true;
		}else {
			
			return false;
		}
		
	}
}
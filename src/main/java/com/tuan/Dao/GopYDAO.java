package com.tuan.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.GopY;
import com.tuan.daoimpl.GopYImpl;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class GopYDAO implements GopYImpl{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean ThemGopY(GopY gopY) {
		 Session session = sessionFactory.getCurrentSession();
		 session.save(gopY);
		return false;
	}
	
}

package com.tuan.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.MauSanPham;
import com.tuan.daoimpl.MauSanPhamImpl;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MauSanPhamDAO implements MauSanPhamImpl {
@Autowired
SessionFactory sessionFactory;

@Transactional
	public List<MauSanPham> LayDanhSachMauSanPham() {
		Session session = sessionFactory.getCurrentSession();
		String query ="from MAUSANPHAM";
		List<MauSanPham> mauSanPhams = session.createQuery(query).getResultList();
		
		return mauSanPhams;
	}

}

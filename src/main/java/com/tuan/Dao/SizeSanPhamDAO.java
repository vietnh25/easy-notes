package com.tuan.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.SizeSanPham;
import com.tuan.daoimpl.SizeSanPhamImpl;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeSanPhamDAO implements SizeSanPhamImpl{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	
	public List<SizeSanPham> LayDanhSachSize() {
		Session session = sessionFactory.getCurrentSession();
		String query = "from SIZESANPHAM";
		List<SizeSanPham> sizeSanPhams = session.createQuery(query).getResultList();
		return sizeSanPhams;
	}

}

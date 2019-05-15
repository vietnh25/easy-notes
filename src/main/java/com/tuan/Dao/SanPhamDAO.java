package com.tuan.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuan.Entity.ChiTietSanPham;
import com.tuan.Entity.SanPham;
import com.tuan.daoimpl.SanPhamimpl;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)//lấy cả class
public class SanPhamDAO implements SanPhamimpl{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional // vì đang truy vấn cơ sở dữ liệu
	public List<SanPham> layDanhSachSanPhamLimit(int spbatdau) {
		Session session = sessionFactory.getCurrentSession();
		// lấy ra danh sách sản phẩm từ id 0->20
		String query = "from SANPHAM";
		List<SanPham> listsanPhams = new ArrayList<SanPham>();
		if(spbatdau<0 ) {
			listsanPhams = (List<SanPham>)session.createQuery(query).getResultList();	
		}else {
			// nếu số page là 1 thì load từ 0-5
			// page là 2 thì load 2-1*5
			// page là 3 thì load 3-1*5
			listsanPhams = (List<SanPham>)session.createQuery(query).setFirstResult(spbatdau).setMaxResults(5).getResultList();

			
		}
		return listsanPhams;
		
	}
	
	@Transactional
	public SanPham layDanhSachChiTietSanPhamTheoMa(int masanpham){
		Session session = sessionFactory.getCurrentSession(); 
		/*
		 *  lấy ra danh sách sản phẩm theo mã với 3 bảng
		 */
		
		String query = "from SANPHAM sp where sp.masanpham =" + masanpham;
		SanPham sanPhams =  (SanPham) session.createQuery(query).getSingleResult();
		
		return (SanPham) sanPhams;
	}
	@Transactional
	public List<SanPham> laySanPhamTheoMaDanhMuc(int madanhmuc) {
		Session session = sessionFactory.getCurrentSession(); 
		String query = "from SANPHAM sp where sp.danhmucsanpham.madanhmuc=" + madanhmuc;
		List<SanPham> sanPhams =  (List<SanPham>) session.createQuery(query).getResultList();
		
		return sanPhams;
	}
	@Transactional
	public boolean XoaSanPhamTheoMaSanPham(int masanpham) {
		try {
			Session session = sessionFactory.getCurrentSession(); 
			//SanPham sanPham  = new SanPham();
			//sanPham.setMasanpham(masanpham);
			// lấy 1 sản phẩm
			SanPham sanPham = session.get(SanPham.class, masanpham);
			session.delete(sanPham);
			return false;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}

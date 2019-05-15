package com.tuan.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.LienHeDAO;
import com.tuan.Entity.LienHe;
import com.tuan.daoimpl.LienHeImpl;

@Service
public class LienHeService implements LienHeImpl{
	@Autowired
	LienHeDAO lienHeDAO;
	public boolean ThemLienHe(LienHe lienHe) {
		 boolean ktrathem = lienHeDAO.ThemLienHe(lienHe);
		return ktrathem;
	}
	
}

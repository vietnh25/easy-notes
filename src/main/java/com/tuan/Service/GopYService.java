package com.tuan.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuan.Dao.GopYDAO;
import com.tuan.Entity.GopY;
import com.tuan.daoimpl.GopYImpl;

@Service
public class GopYService implements GopYImpl{
@Autowired
GopYDAO gopYDAO;

	public boolean ThemGopY(GopY gopY) {
		
		return gopYDAO.ThemGopY(gopY);
	}

}

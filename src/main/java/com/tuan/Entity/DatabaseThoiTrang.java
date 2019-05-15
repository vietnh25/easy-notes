package com.tuan.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class DatabaseThoiTrang  {
	
	private JdbcTemplate jdbctemplate;
	 
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbctemplate = new JdbcTemplate(dataSource);
		
	}
	
	/* public void getListNhanVien() {
		String sql = "select * from NhanVien";
		List<NhanVien> listNhanVien = jdbctemplate.query(sql, new RowMapper<NhanVien>() {

			public NhanVien mapRow(ResultSet rowResult, int arg1) throws SQLException {
				NhanVien nv = new NhanVien();
				nv.tenNV = rowResult.getString("tenNhanVien");
				nv.tuoiNV = rowResult.getInt("tuoi");
				return nv;
			}
		});
		for(NhanVien result: listNhanVien) {
			System.out.println("giá trị : " + result.tenNV + " - " + result.tuoiNV);
		}
				
	}*/
}

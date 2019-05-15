package com.tuan.Entity;

import java.io.Serializable;

public class ChiTietHoaDonId implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int mahoadon;
	int machitietsanpham;
	
	
	public int getMahoadon() {
		return mahoadon;
	}
	public void setMahoadon(int mahoadon) {
		this.mahoadon = mahoadon;
	}
	public int getMachitietsanpham() {
		return machitietsanpham;
	}
	public void setMachitietsanpham(int machitietsanpham) {
		this.machitietsanpham = machitietsanpham;
	}
	
	
}

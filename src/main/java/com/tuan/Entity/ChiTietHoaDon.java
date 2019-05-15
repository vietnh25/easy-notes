package com.tuan.Entity;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;


@Entity(name="CHITIETHOADON")
//@IdClass(ChiTietHoaDonId.class)
public class ChiTietHoaDon implements Serializable{
	@EmbeddedId
	// do có biến ngoại lai nên tạo thêm class ChiTietHoaDonId
	// không thể dùng jointable
	ChiTietHoaDonId chiTietHoaDonId;

	int soluong;
	String giatien;
	public ChiTietHoaDonId getChiTietHoaDonId() {
		return chiTietHoaDonId;
	}
	public void setChiTietHoaDonId(ChiTietHoaDonId chiTietHoaDonId) {
		this.chiTietHoaDonId = chiTietHoaDonId;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public String getGiatien() {
		return giatien;
	}
	public void setGiatien(String giatien) {
		this.giatien = giatien;
	}
	
	
}

package com.tuan.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="LIENHE")
public class LienHe {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	int malienhe;
	String tenkhachhang;
	String email;
	String tencty;
	String diachicty;
	String noidung;
	String sodt;

	public int getMalienhe() {
		return malienhe;
	}

	public void setMalienhe(int malienhe) {
		this.malienhe = malienhe;
	}

	public String getTenkhachhang() {
		return tenkhachhang;
	}

	public void setTenkhachhang(String tenkhachhang) {
		this.tenkhachhang = tenkhachhang;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTencty() {
		return tencty;
	}

	public void setTencty(String tencty) {
		this.tencty = tencty;
	}

	public String getDiachicty() {
		return diachicty;
	}

	public void setDiachicty(String diachicty) {
		this.diachicty = diachicty;
	}

	public String getNoidung() {
		return noidung;
	}

	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}

	public String getSodt() {
		return sodt;
	}

	public void setSodt(String sodt) {
		this.sodt = sodt;
	}

	
}

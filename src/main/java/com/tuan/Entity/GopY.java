package com.tuan.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ValueGenerationType;

@Entity(name="GOPY")
public class GopY {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	int magopy;
	String email;
	String noidung;
	public int getMagopy() {
		return magopy;
	}
	public void setMagopy(int magopy) {
		this.magopy = magopy;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	
}

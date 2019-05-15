package com.tuan.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="GALLERYSANPHAM")
public class GallerySanPham {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int magallerysanpham;
	String gallery;
	public int getMagallerysanpham() {
		return magallerysanpham;
	}
	public void setMagallerysanpham(int magallerysanpham) {
		this.magallerysanpham = magallerysanpham;
	}
	public String getGallery() {
		return gallery;
	}
	public void setGallery(String gallery) {
		this.gallery = gallery;
	}
	
	
}

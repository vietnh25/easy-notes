-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: thoitrangshop
-- ------------------------------------------------------
-- Server version	8.0.13
create database thoitrangshop
use thoitrangshop
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitiethoadon` (
  `mahoadon` int(11) NOT NULL,
  `machitietsanpham` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `giatien` int(11) DEFAULT NULL,
  PRIMARY KEY (`mahoadon`,`machitietsanpham`),
  KEY `FK_CHITIETHOADON_CHITIETSANPHAM` (`machitietsanpham`),
  CONSTRAINT `FK_CHITIETHOADON_CHITIETSANPHAM` FOREIGN KEY (`machitietsanpham`) REFERENCES `chitietsanpham` (`machitietsanpham`),
  CONSTRAINT `FK_CHITIETHOADON_HOADON` FOREIGN KEY (`mahoadon`) REFERENCES `hoadon` (`mahoadon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (1,2,1,300),(1,3,1,300),(2,1,2,150),(2,2,2,300),(2,3,2,300);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietkhuyenmai`
--

DROP TABLE IF EXISTS `chitietkhuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitietkhuyenmai` (
  `makhuyenmai` int(11) NOT NULL,
  `masanpham` int(11) NOT NULL,
  PRIMARY KEY (`makhuyenmai`,`masanpham`),
  KEY `FK_CHITIETKHUYENMAI_SANPHAM` (`masanpham`),
  CONSTRAINT `FK_CHITIETKHUYENMAI` FOREIGN KEY (`makhuyenmai`) REFERENCES `khuyenmai` (`makhuyenmai`),
  CONSTRAINT `FK_CHITIETKHUYENMAI_SANPHAM` FOREIGN KEY (`masanpham`) REFERENCES `sanpham` (`masanpham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietkhuyenmai`
--

LOCK TABLES `chitietkhuyenmai` WRITE;
/*!40000 ALTER TABLE `chitietkhuyenmai` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietkhuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietsanpham`
--

DROP TABLE IF EXISTS `chitietsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitietsanpham` (
  `machitietsanpham` int(11) NOT NULL AUTO_INCREMENT,
  `masanpham` int(11) DEFAULT NULL,
  `masize` int(11) DEFAULT NULL,
  `mamau` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `ngaynhap` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`machitietsanpham`),
  KEY `FK_CHITIET_SANPHAM` (`masanpham`),
  KEY `FK_CHITIET_SIZE` (`masize`),
  KEY `FK_SANPHAM_MAUSANPHAM` (`mamau`),
  CONSTRAINT `FK_CHITIET_SANPHAM` FOREIGN KEY (`masanpham`) REFERENCES `sanpham` (`masanpham`),
  CONSTRAINT `FK_CHITIET_SIZE` FOREIGN KEY (`masize`) REFERENCES `sizesanpham` (`masize`),
  CONSTRAINT `FK_SANPHAM_MAUSANPHAM` FOREIGN KEY (`mamau`) REFERENCES `mausanpham` (`mamau`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietsanpham`
--

LOCK TABLES `chitietsanpham` WRITE;
/*!40000 ALTER TABLE `chitietsanpham` DISABLE KEYS */;
INSERT INTO `chitietsanpham` VALUES (1,1,1,1,12,'1/4/2019'),(2,2,2,2,10,'1/4/2019'),(3,2,3,3,22,'1/4/2019'),(4,3,4,4,55,'1/4/2019'),(5,4,5,5,33,'1/4/2019'),(6,5,2,4,22,'1/4/2019'),(7,6,6,7,55,'1/4/2019'),(8,7,6,1,11,'1/4/2019'),(9,8,4,2,22,'1/4/2019');
/*!40000 ALTER TABLE `chitietsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chucvu` (
  `machucvu` int(11) NOT NULL AUTO_INCREMENT,
  `tenchucvu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`machucvu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'Nhân Viên'),(2,'Admin'),(3,'Người Dùng');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmucsanpham`
--

DROP TABLE IF EXISTS `danhmucsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `danhmucsanpham` (
  `madanhmuc` int(11) NOT NULL AUTO_INCREMENT,
  `tendanhmuc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinhdanhmuc` text,
  PRIMARY KEY (`madanhmuc`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmucsanpham`
--

LOCK TABLES `danhmucsanpham` WRITE;
/*!40000 ALTER TABLE `danhmucsanpham` DISABLE KEYS */;
INSERT INTO `danhmucsanpham` VALUES (1,'Áo sơ mi',NULL),(2,'Áo thun',NULL),(3,'Quần thun',NULL),(4,'Áo khoác',NULL),(5,'Áo đôi',NULL),(6,'Quần tây',NULL),(7,'Quần Kaki',NULL),(8,'Áo nữ',NULL),(9,'Áo nam',NULL),(10,'Quần Nữ',NULL),(11,'Quần Nam',NULL);
/*!40000 ALTER TABLE `danhmucsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallerysanpham`
--

DROP TABLE IF EXISTS `gallerysanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gallerysanpham` (
  `magallerysanpham` int(11) NOT NULL AUTO_INCREMENT,
  `gallery` text,
  PRIMARY KEY (`magallerysanpham`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallerysanpham`
--

LOCK TABLES `gallerysanpham` WRITE;
/*!40000 ALTER TABLE `gallerysanpham` DISABLE KEYS */;
INSERT INTO `gallerysanpham` VALUES (1,'155_Ao_so_mi_nam_tay_dai_theu_o_nguc_b9812.jpg'),(2,'ao-so-mi-xanh-bien-asm1219-10052-p-s-t.jpg');
/*!40000 ALTER TABLE `gallerysanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hoadon` (
  `mahoadon` int(11) NOT NULL AUTO_INCREMENT,
  `tenkhachhang` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sodt` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diachigiaohang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tinhtrang` tinyint(1) DEFAULT NULL,
  `ngaylap` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinhthucgiaohang` varchar(45) DEFAULT NULL,
  `ghichu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mahoadon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,'Ã¡aaa','2312','Ã¡das',0,NULL,'Giao HÃ ng Táº­n NÆ¡i','DSFF'),(2,'tuanq','12314','asdasd',0,NULL,'Giao HÃ ng Táº­n NÆ¡i','waeeeeee');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyenmai`
--

DROP TABLE IF EXISTS `khuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khuyenmai` (
  `makhuyenmai` int(11) NOT NULL AUTO_INCREMENT,
  `tenkhuyenmai` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoigianbatdau` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thoigianketthuc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mota` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinhkhuyenmai` text,
  `giagiam` int(11) DEFAULT NULL,
  PRIMARY KEY (`makhuyenmai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyenmai`
--

LOCK TABLES `khuyenmai` WRITE;
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lienhe`
--

DROP TABLE IF EXISTS `lienhe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lienhe` (
  `malienhe` int(11) NOT NULL AUTO_INCREMENT,
  `tenkhachhang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sodt` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tencty` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diachicty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `noidung` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`malienhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lienhe`
--

LOCK TABLES `lienhe` WRITE;
/*!40000 ALTER TABLE `lienhe` DISABLE KEYS */;
/*!40000 ALTER TABLE `lienhe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mausanpham`
--

DROP TABLE IF EXISTS `mausanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mausanpham` (
  `mamau` int(11) NOT NULL AUTO_INCREMENT,
  `tenmau` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`mamau`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mausanpham`
--

LOCK TABLES `mausanpham` WRITE;
/*!40000 ALTER TABLE `mausanpham` DISABLE KEYS */;
INSERT INTO `mausanpham` VALUES (1,'vàng'),(2,'đỏ'),(3,'tím'),(4,'hồng'),(5,'xanh lá cây'),(6,'đen'),(7,'trắng');
/*!40000 ALTER TABLE `mausanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nhanvien` (
  `manhanvien` int(11) NOT NULL AUTO_INCREMENT,
  `hoten` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diachi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gioitinh` tinyint(1) DEFAULT NULL,
  `cmnd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `machucvu` int(11) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tendangnhap` varchar(20) DEFAULT NULL,
  `matkhau` varchar(20) DEFAULT NULL,
  `malienhe` int(11) DEFAULT NULL,
  PRIMARY KEY (`manhanvien`),
  KEY `FK_NHANVIEN_CHUCVU` (`machucvu`),
  KEY `FK_NHANVIEN_LIENHE_idx` (`malienhe`),
  CONSTRAINT `FK_NHANVIEN_CHUCVU` FOREIGN KEY (`machucvu`) REFERENCES `chucvu` (`machucvu`),
  CONSTRAINT `FK_NHANVIEN_LIENHE` FOREIGN KEY (`malienhe`) REFERENCES `lienhe` (`malienhe`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'đặng mạnh tuấn','Vĩnh Ngọc,Đông Anh,Hà Nội',1,'033564654',2,'tuanmanh322@gmail.com','dangmanhtuan','123456',NULL),(2,'Nguyễn Văn A','Đông Anh,Hà Nội',1,'0345646523',2,'abc123@gmail.com','abc123@gmail.com','123456',NULL),(3,'Nguyễn Thị C','Hà Nội',0,'0354231548',2,'aaaa@gmail.com','aaaa@gmail.com','123456',NULL);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sanpham` (
  `masanpham` int(11) NOT NULL AUTO_INCREMENT,
  `madanhmuc` int(11) DEFAULT NULL,
  `tensanpham` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `giatien` varchar(50) DEFAULT NULL,
  `mota` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinhsanpham` text,
  `gianhcho` varchar(45) DEFAULT NULL,
  `magallerysanpham` int(11) DEFAULT NULL,
  PRIMARY KEY (`masanpham`),
  KEY `FK_SANPHAM_DANHMUC` (`madanhmuc`),
  KEY `FK_SANPHAM_GALLERYSANPHAM_idx` (`magallerysanpham`),
  CONSTRAINT `FK_SANPHAM_DANHMUC` FOREIGN KEY (`madanhmuc`) REFERENCES `danhmucsanpham` (`madanhmuc`),
  CONSTRAINT `FK_SANPHAM_GALLERYSANPHAM` FOREIGN KEY (`magallerysanpham`) REFERENCES `gallerysanpham` (`magallerysanpham`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,1,'Áo sơ mi loại 1','150.000 ','Thiết kế đơn giản và hiện đại','ao-so-mi-trang-asm1219-10049-p-s-t.jpg','Nam',NULL),(2,1,'Áo sơ mi loại vip','300.000 ','Thiết kế đơn giản và hiện đại','ao-so-mi-trang-kem-asm836-5759-p-s-t.jpg','Nam',NULL),(3,2,'Áo thun nam lacote','450.000 ','Thiết kế đơn giản và hiện đại','BNsz2T_simg_b5529c_250x250_maxb.jpg','Nam',NULL),(4,2,'Áo thun nam hiệu Adidas','490.000 ','Thiết kế đơn giản và hiện đại','CwBBIU_simg_b5529c_250x250_maxb.jpg','Nam',NULL),(5,3,'Quần thun hiệu AA','300.000 ','Thiết kế đơn giản và hiện đại','mfnC4b_simg_b5529c_250x250_maxb.jpg','Nữ',NULL),(6,3,'Quần thun hàng hiệu','490.000 ','Thiết kế đơn giản và hiện đại','PAEVhn_simg_b5529c_250x250_maxb.jpg','Nam',NULL),(7,4,'Áo khoác mùa đông','490.000 ','Thiết kế đơn giản và hiện đại','207_Ao_khoac_kaki_phoi_day_keo_mau_den_c2428.jpg','Nữ',NULL),(8,4,'Áo khoác chất dạ','490.000 ','Thiết kế đơn giản và hiện đại','175_Ao_khoac_du_mau_do_in_logo_b3559.jpg','Nữ',NULL),(9,5,'Áo đôi hàng hiệu','300.000 ','Thiết kế đơn giản và hiện đại','Ao - cap - doi - AD0199.jpg','Nữ',NULL),(10,6,'Quần Tây Hiệu','200.000 ','Thiết kế đơn giản và hiện đại','quan-jean-den-qj1394-7744-slide-products-5b179e771b24c.jpg','Nam',NULL),(11,6,'Quần Tây Hiệu 1','490.000 ','Thiết kế đơn giản và hiện đại','quan-tay-xanh-bich-co-gian-qt41-4844-p-s-t.jpg','Nam',NULL),(12,7,'Quần kaki loại 3','300.000 ','Thiết kế đơn giản và hiện đại','quan-kaki-han-quoc-xanh-co-vit-qk155-3855-p-s-t.jpg','Nam',NULL),(13,7,'Quần kaki loại 1','490.000 ','Thiết kế đơn giản và hiện đại','quan-tay-den-qt92-6754-p-s-t.jpg','Nữ',NULL),(14,2,'Áo thun nữ hiệu 1','300.000 ','Thiết kế đơn giản và hiện đại','O6Abhj_simg_b5529c_250x250_maxb.jpg','Nữ',NULL),(15,2,'Áo thun nữ hiệu 3','200.000 ','Thiết kế đơn giản và hiện đại','11_Ao_thun_nu_mau_trang_in_hinh_ca_tinh_c1342.jpg','Nữ',NULL),(16,1,'Áo sơ mi loại tốt','200.000 ','Thiết kế đơn giản và hiện đại','8r4Y7r_simg_b5529c_250x250_maxb.jpg','Nam',NULL),(17,10,'Quần nữ Loại 1','200.000 ','Thiết kế đơn giản và hiện đại','22_Quan_legging_logo_meo_c2301.jpg','Nữ',NULL),(18,10,'Quần nữ Loại 2','200.000 ','Thiết kế đơn giản và hiện đại','126_Quan_legging_logo_meo_c2479.jpg','Nữ',NULL),(19,10,'Quần nữ Loại 3','150.000 ','Thiết kế đơn giản và hiện đại','74_Quan_tay_lung_kem_dai_eo_mau_nau_c2265.jpg','Nữ',NULL),(20,10,'Quần nữ Loại 4','130.000 ','Thiết kế đơn giản và hiện đại','NnLAOT_simg_de2fe0_500x500_maxb.jpg','Nữ',NULL),(21,7,'Quần kaki nam loại 1','199.000 ','Thiết kế đơn giản và hiện đại','quan-kaki-han-quoc-xanh-co-vit-qk155-3855-p-s-t.jpg','Nam',NULL),(22,11,'Quần âu nam vip','299.000 ','Thiết kế đơn giản và hiện đại','quan-short-kaki-xanh-qs72-3894-p-s-t.jpg',NULL,NULL);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizesanpham`
--

DROP TABLE IF EXISTS `sizesanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sizesanpham` (
  `masize` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`masize`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizesanpham`
--

LOCK TABLES `sizesanpham` WRITE;
/*!40000 ALTER TABLE `sizesanpham` DISABLE KEYS */;
INSERT INTO `sizesanpham` VALUES (1,'M'),(2,'S'),(3,'L'),(4,'XL'),(5,'XXL'),(6,'XXXL');
/*!40000 ALTER TABLE `sizesanpham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 21:49:07

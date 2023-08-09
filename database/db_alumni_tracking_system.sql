-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_alumni_tracking_system
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kerja`
--

DROP TABLE IF EXISTS `kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kerja` (
  `id_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan_tgl` varchar(150) NOT NULL,
  `alamat_perusahaan_tgl` varchar(255) NOT NULL,
  `kota_perusahaan_tgl` varchar(150) NOT NULL,
  `nama_hrd_perusahaan_tgl` varchar(255) NOT NULL,
  `no_telp_hrd_perusahaan_tgl` varchar(15) NOT NULL,
  `tahun_mulai_bekerja_tgl` int(4) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  PRIMARY KEY (`id_kerja`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `kerja_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kerja`
--

LOCK TABLES `kerja` WRITE;
/*!40000 ALTER TABLE `kerja` DISABLE KEYS */;
INSERT INTO `kerja` VALUES (3,'PT Masa Iyaa','Jl. Mangga Dua Selatan','Jakarta Pusat','Epen','+6289677668899',2021,52),(6,'PT. Harapan Abadi','Jl. Ujung Barat ','Jakarta Utara','Andi','+6285644556655',2020,54),(7,'PT Iseng Ajahh','Jl. Iseng Doang','Jakarta Barat','Epan','+6286655443322',2020,60),(9,'PT. Rizki Abadi','Jl. Utara Doang','Jakarta Barat','Putra Akhirun','+6287766887766',2023,71),(10,'Abadi Jaya Rezeki','Jl. Pembangunan','Jakarta Utara','Rendi','+6289966774455',2022,83);
/*!40000 ALTER TABLE `kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kuliah`
--

DROP TABLE IF EXISTS `kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kuliah` (
  `id_kuliah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perguruan_tinggi_tgl` varchar(150) NOT NULL,
  `alamat_perguruan_tinggi_tgl` varchar(255) NOT NULL,
  `kota_perguruan_tinggi_tgl` varchar(150) NOT NULL,
  `jurusan_perguruan_tinggi_tgl` varchar(150) NOT NULL,
  `jenjang_pendidikan_tgl` varchar(5) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  PRIMARY KEY (`id_kuliah`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `kuliah_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuliah`
--

LOCK TABLES `kuliah` WRITE;
/*!40000 ALTER TABLE `kuliah` DISABLE KEYS */;
INSERT INTO `kuliah` VALUES (30,'Univ Gak Jelas','Jl. Bwasdfjalskdfiaf','Jakarta Barat','Teknik Komputer','D4',35),(32,'Universitas Negeri Jakarta','Jl. Rawamangun','Jakarta Timur','Rekayasa Perangkat Lunak ','S1',37),(33,'Universitas Negeri Jakarta','Jl. Rawamangun','Jakarta Timur','Rekayasa Perangkat Lunak ','S1',38),(37,'Universitas Negeri Jakarta','Jl. Rawamangun Utara','Jakarta Timur','Rekayasa Perangkat Lunak','S1',40),(38,'Bina Sarana Informatika','Jl. Pecenongan','Jakarta Utara','Rekayasa Perangkat Lunak','S1',59),(39,'Bina Sarana Informatika','Jl. Bina Sarana Informatika Utara','Jakarta Barat','Teknik Komputer','S1',64),(40,'Universitas Bina Nusantara','Jl. Binus Barat','Jakarta Pusat','Teknik Komputer','S1',66),(41,'asdfasdkfj','addflkasdlfkj','Bekasi Barat','Rekayasa Perangkat Lunak','S1',67),(43,'Bina Sarana Informatika','Jl. Gak Tau Dah Sumpah No. 12','Jakarta Utara','Teknik Komputer','S1',69),(45,'Universitas Bina Nusantara','Jl. Gak Tau','Jakarta Utara','Teknik Komputer','S1',76),(46,'Universitas Padjajaran','Jl. Bandung Ujung','Bandung','Teknik Perangkat Lunak','S2',77),(47,'Universitas Gunadarma','Jl. Depok','Depok','Teknik Mesin','S1',78);
/*!40000 ALTER TABLE `kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kuliah_dan_kerja`
--

DROP TABLE IF EXISTS `kuliah_dan_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kuliah_dan_kerja` (
  `id_kuliah_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perguruan_tinggi` varchar(150) NOT NULL,
  `alamat_perguruan_tinggi` varchar(255) NOT NULL,
  `kota_perguruan_tinggi` varchar(150) NOT NULL,
  `jurusan_perguruan_tinggi` varchar(150) NOT NULL,
  `jenjang_pendidikan` varchar(5) NOT NULL,
  `nama_perusahaan` varchar(150) NOT NULL,
  `alamat_perusahaan` varchar(255) NOT NULL,
  `kota_perusahaan` varchar(150) NOT NULL,
  `nama_hrd` varchar(255) NOT NULL,
  `no_telp_hrd` varchar(15) NOT NULL,
  `tahun_mulai_bekerja` int(4) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  PRIMARY KEY (`id_kuliah_kerja`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `kuliah_dan_kerja_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuliah_dan_kerja`
--

LOCK TABLES `kuliah_dan_kerja` WRITE;
/*!40000 ALTER TABLE `kuliah_dan_kerja` DISABLE KEYS */;
INSERT INTO `kuliah_dan_kerja` VALUES (1,'Universitas Negeri Jakarta','Jl. Rawamangun Utara','Jakarta Timur','Rekayasa Perangkat Lunak ','S2','PT. Gak Tau','Jl. Mangga Besar 9','Jakarta Barat','Ecep','+6285622334433',2022,42),(4,'Institut Teknologi Bandung','Jl. Bandung','Bandung','Teknik Komputer','S1','Berlian Cinta','Jl. Pasar Ujung Jalan','Bandung','Asep','+6289678452312',2021,55),(5,'Bina Sarana Informatika','Jl. Mangga Dua Selatan','Jakarta Utara','Rekayasa Perangkat Lunak ','S1','PT Mencari Cinta Sejati','Jl. Mangga Dua Selatan','Jakarta Utara','Wildan','+6289654321457',2022,58),(6,'Universitas Gak Jelas','Jl. Gak Jelas Juga','Jakarta Utara','Teknik Komputer','D4','PT Gak Jelas','Jl. Gak Tau Dah','Jakarta Timur','Adul','+6285211335577',2021,61),(8,'Bina Sarana Informatika','Jl. Iseng Doang','Jakarta Pusat','Teknik Komputer','S1','PT Mencari Cinta Sejati','Jl. Mangga Dua Selatan','Jakarta Utara','Aldi','+6283211223322',2022,72);
/*!40000 ALTER TABLE `kuliah_dan_kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tahun_lulus` int(4) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (21,'Kedua Ajjah',2023,'kedua','$2a$10$yaZUCDFDbZH.LcOkcxGJ8Oc/cXvyODKk/Oww6PCHCDahqP8BeNLSC','User'),(22,'Ketiga',2022,'ketiga','$2a$10$9gaHG/O8AnkIZJ1PH3zPSecflLQpaYOTPuJc35IaCphZTxRsTP3Y6','User'),(23,'Keempat',2021,'keempat','$2a$10$FM6OEFCHtlsExJwXej15JOymlHnvyS8x2q3iVkcip/oI3vGhcopjq','User'),(24,'',0,'admin','$2a$10$hdBW83LpcDlJr4z450HqnOlVs5juNauNTxo.NXQdY./K7pyuikvVK','Admin'),(25,'',0,'kelima','$2a$10$VaDtOexgz7CHKvhlPC365.SKeKSADVwfxyJ6Dp6YFY2LdDCqHEBQq','User'),(26,'Keenam',0,'keenam','$2a$10$1Ay.3FAIXPUURDmYqG2emuuIBO9OeiMxNEZc3X6zXZ3uUlGiLeijq','User'),(27,'',0,'ketujuh','$2a$10$RylFzr1cB4I450SvECpJruPcFX.gcA60FO3uAXbUq.3uvi/4TF.KG','User'),(28,'',0,'kedelapan','$2a$10$fluhAJbmXKVtCedgMqNvvODcEKlHXQixp0gjd0cuySc5xf.fiYmnG','User'),(30,'',0,'coba','$2a$10$sHRXfyy0p.Bz0b99VcS.Me45zI4Z0Y2GH5qQAXSNjYt1EdB/.OE2a','User'),(31,'',0,'cobadoang','$2a$10$0dNkwNlVvaKyTLAk4z8UUOMwKuMRBivVvE4kTIyfwM1b3sm3AdR4S','User'),(32,'',0,'cobalagi','$2a$10$dRVMELJZrwgRLQ0o6kQQhO4yxjAl7KySUCbaFLcvuagn.fFBc3Oau','User'),(33,'',0,'tai','$2a$10$oNRyMqCPObxEUAu4ILs9J.7E6z7X7Z5dptigB8Moso9OFpXHQLHd6','User'),(34,'',0,'kerja','$2a$10$LQxVRJ1MbulxEaQgSejgCO1DvmXtumoezjPp6ex6UAjHsFdP391Se','User'),(35,'',0,'kuliah','$2a$10$BTxitNZnE9BXOFKfOME.w.Ibl6eicLl47U7Mndnc0PvHWesLBu2dq','User'),(36,'',0,'kerjalagi','$2a$10$wT0tqntBVeocA1ILraCIweqQaxtvTTb0WZ2yf54iwz9Xrr194sBuC','User'),(37,'',0,'kuliahdankerja','$2a$10$q9SHRUGT4x2/5MncDKaXU.jZ6nmhSunHkVbRHpmFpkNKx/sezyqdG','User'),(40,'',0,'kuliahdankerjasatu','$2a$10$X0z9SQEczTB0k9VD0Zlr/evC5KCKpGkcm1VrFcfs/vtvcyQSyvHFm','User'),(41,'',0,'kuliahdankerjasatu','$2a$10$fZY0sOvYAimDmnTzq/azGu84z8YwxKhlwOiDUoJhF4qvoM1JlPJ9m','User'),(42,'',0,'testformkuliah','$2a$10$9Q8S1eVHKlsG4EwZc7QWB.mJmDrlaHKz/OZKbcHReEYeciH3xNPNa','User'),(43,'',0,'testformkerja','$2a$10$CQEY/uPxSObrhlil.O8wF.nAfWUj3t7IpYPKacBV5Bgmf8.RvToXy','User'),(44,'Test Form Kuliah Dan Kerja',2020,'testformkuliahdankerja','$2a$10$5rVg5E/lKp9dOZl.hXs1YuKqcape4/Wlin6joWKhfmNbE5Q2sVpdW','User'),(45,'',0,'testmenganggur','$2a$10$zIXCJfqeP4LurDpADI6IZu2pgZIl8GbVXK57ifo.OFiRdzRGF45GK','User'),(49,'',0,'testulang','$2a$10$JoYtsZ0ocp2Oecsd8uWGHuOSuMvqq2f.TbkV1cNZTxIqrT8B6n9de','User'),(50,'',0,'testsiswa','$2a$10$6CtPsyQMwCWUPoXLaRFjDOFLiZpuuOeVa3TKtelPue2iDflj0Jeg6','User'),(51,'',0,'cobakuliah','$2a$10$FHPlYi3x6rYBHlR5usfLuu.57EFIkcHv6VLFiaPIbZD4JQ2l80Jo6','User'),(52,'',0,'testlogin','$2a$10$8xtWZY8WbGwniW/rhNhb3u3CykIBT6q5/uExU8CEFXQW3bWSiAHNK','User'),(62,'',0,'iniusernamesatu','$2a$10$47l5ECDV1hiCoQMtks/tw.IXJ8iT0XiamNX5lIcYlDclhuksDID.u','User'),(63,'',0,'iniusernamedua','$2a$10$k79aRxhXO6hzNWHhb75YpumMpdbnJAsZjdbAtEMY9JA4q2ko4F7ma','User'),(64,'',0,'testlagisatu','$2a$10$8kpRo9wkIrOBqLFz4J1nreqxDA89eNjv9qBtP1PtDpoNFRegibjzK','User'),(65,'',0,'testlagidua','$2a$10$iMdiow40/1IPFA3XsgVihuP91PH1B2OuT0q5wEnfHpJftVD5v5.qC','User'),(66,'',0,'testlagitiga','$2a$10$rz1.WSmubLipdFrn0SLAqelNwATf6flthENfS59a7hqeysg3/Ux0m','User'),(67,'',0,'cobacoba','$2a$10$l.NlZw9STMWpSPnIYZ.TZO4arzmWYf3AE0Fo.RRRGfm3m08teUK8K','User'),(68,'Rizki Alif Mutaqin',2022,'rizkidoang','$2a$10$DGcml198eX7zTU0f9/O/zeNWqAqPvssQ/XwJm4evA9qwf3ZJnGq0O','User'),(69,'Pengangguran',2022,'menganggur','$2a$10$jBBdIB.TIIubs2PGghWVUu1QFZBIQ4q5Ckq1crjeDumrNzv6lYuly','User'),(70,'Testing ImportSatu',2022,'testingimportsatu','$2a$10$IrUTuY5qBczFwIlbxOZz4.RjNTU2ATsk0hVz2cRzn9mqUx3aKBxEG','User'),(71,'Testing ImportDua',2022,'testingimportdua','$2a$10$q47iGaMigZUUDFa5HUsOLOaWhuCdtYzBtfkIqHz713NT2VzzvDicq','User'),(72,'Testing ImportDua',2022,'testingimportdua','$2a$10$0zSn..mPh8w8XefA51vDmOhTGrF5aeBMpDfYfk256ar.Iopl/WiDu','User'),(73,'Testing Import Tiga',2022,'testingimporttiga','$2a$10$sot/srKPWa.LLDEJ49f.p.uJiJmkJOPCO5CcJ7OA/QBndie9pZcA2','User'),(74,'Pulpen Satu',2021,'pulpensatu','$2a$10$esNxO0sq7Z187Nxdm8sOhePtrHeH2i2iU5oITOXmheDz40S4F5x0a','User'),(76,'Pulpen Tiga',2022,'pulpentiga','$2a$10$8PgLabu4eeteQfI8/Mfmu.Tj4z8wHlPtJKd0q..HJjZ4KWFqWLvOa','User'),(77,'Test Nganggur',2021,'testnganggur','$2a$10$OXwiAN5LAIG2w.a1gbSjfefUjGNaNrCFMvKRADYV2YUSBSvxwiGCe','User'),(78,'Coba Doang',2021,'cobadoang','$2a$10$1xe9OHMlZwDoLoPocgAX.OPzBoUBfw724R4TcA1YmVVA6kSAUOhVC','User'),(79,'Coba Nama ',2020,'cobanama','$2a$10$F3yc4E6q1muws4OjAU5G1uCXjWbfxr4foQjSNdZfDU95NgvnwqS9q','User'),(80,'Coba Nama Lagi',2021,'cobanamalagi','$2a$10$Z6THYTRpcCFKReFHKt6MHeln.i7YWn/RvSx7uWR/PyU5YT3YhQZKS','User'),(81,'Test Nama',2022,'testnama','$2a$10$6EB9SwbJFYF2E.58nETlNemuKFPvLWTuHLmHfNyJeANbxlvdSH0AK','User'),(83,'Thest',2021,'thest','$2a$10$u0Q8HQipGQkMLHOVXAb.XuyWwv8AXrVQF.WGWquRT.sXxsLkX7HDe','User'),(86,'Angka',2021,'angka','$2a$10$UUVJRPGZlYxJ43Bq/sUK4eD.yCxNR9F1NL1hba0ZpAZTzxFZ6irmy','User'),(88,'Anggur',2021,'anggur','$2a$10$fV6bCt/3InkmdM/1bGyY6.KbIw8kU8PlpPFXN.e6Y6r/CUOr8Sahq','User'),(89,'baru',2020,'baru','$2a$10$0FEGqmmDKqhtmGPJG8uCU.EoUU2v4ca6e4T5g3fxQ168ghsb2rKCS','User');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nisn` varchar(11) NOT NULL,
  `nis` varchar(11) NOT NULL,
  `kelas_terakhir` varchar(15) NOT NULL,
  `pic_siswa` varchar(255) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` varchar(11) NOT NULL,
  `email_siswa` varchar(255) NOT NULL,
  `no_telp_siswa` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(150) NOT NULL,
  `provinsi` varchar(150) NOT NULL,
  `angkatan` int(4) NOT NULL,
  `jurusan` varchar(5) NOT NULL,
  `aktifitas_stlh_lulus` varchar(50) NOT NULL,
  `id_login` int(11) NOT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `id_login` (`id_login`),
  CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` VALUES (35,'0059383561','2134312321','XII TEL 04','1688141830719-WIN_20221121_11_31_58_Pro.jpg','Jakarta','2005-05-04','kedua@gmail.com','+6285244553344','Jl. Mangga Dua Timur','Jakarta Utara','DKI Jakarta',2020,'TJA','Kuliah',21),(37,'999999','777777','XII TEL 12','1688142432023-WIN_20230610_18_03_02_Pro.jpg','Jakarta','2004-07-16','ketiga@gmail.com','+6285566445533','Jl. Ketiga','Jakarta Utara','DKI Jakarta',2019,'RPL','Kuliah',22),(38,'321321321','333333333','XII TEL 01','1688188227630-kucing.jpg','Jakarta','','','','Jl. Mangga Besar 9','Jakarta Barat','DKI Jakarta',0,'RPL','Kuliah',25),(39,'98989898','66666666','XII TEL 05','1688189804748-BijiDuren.png','Jakarta','2005-06-17','keenam@gmail.com','+6286544556655','Jl. Mangga Besar','Jakarta Barat','DKI Jakarta',2018,'TKJ','Wirausaha',26),(40,'888888','7777777','','1688190452243-Group 1.png','Jakarta','','','','Jl. Mangga Besar 9','Jakarta Barat','DKI Jakarta',0,'TJA','Kuliah',27),(42,'2147483647','2147483647','','1688227526441-sinchan.jpeg','Jakarta','','','','Jl. Mangga Besar 9','Jakarta Barat','DKI Jakarta',0,'RPL','Kuliah dan Kerja',30),(52,'34343434','55555555','','1688272494159-alif.jpg','Bekasi','2004-07-15','testkerja@gmail.com','+6286677668877','Jl. Mangga Dua Selatan','Jakarta Utara','DKI Jakarta',0,'RPL','Kerja',34),(53,'67676767','565656565','','1688273695090-Black Modern Elegant Perfume Instagram  Story (2).png','Jakarta','2005-10-20','kuliah@gmail.com','+6287898980909','Jl. Kerja','Jakarta Utara','DKI Jakarta',0,'TR','Kuliah',35),(54,'789789789','5544556','','1688281792638-admin.png','Jakarta','2004-07-02','testkerjalagi@gmail.com','+6286655776688','Jl. Ujung Gang 12','Jakarta Barat','DKI Jakarta',0,'RPL','Kerja',36),(55,'3434343','43434343','','1688283381915-Frame 1.png','Jakarta','2004-06-18','testkuliahdankerja@gmail.com','+6286567876767','Jl. Kuliah dan Kerja','Jakarta Barat','DKI Jakarta',0,'TJA','Kuliah dan Kerja',37),(58,'990990556','223456567','','1688290523034-WIN_20221104_10_10_37_Pro.jpg','Jakarta','2004-11-03','kuliahdankerja@gmail.com','+6285676767676','Jl. Test Doang','Jakarta Pusat','DKI Jakarta',0,'TR','Kuliah dan Kerja',40),(59,'898989898','212121212','','1688308317633-WIN_20221103_11_32_20_Pro.jpg','Jakarta','2005-03-10','testformkuliah@gmail.com','+62855555555555','Jl. Ngasal','Jakarta Utara','DKI Jakarta',0,'TJA','Kuliah',42),(60,'11111111','88888888','','1688310082778-WIN_20221119_12_56_09_Pro.jpg','Jakarta','2003-06-02','testformkerja@gmail.com','+6286655665566','Jl. Pisang Ambon','Jakarta Utara','DKI Jakarta',0,'TR','Kerja',43),(61,'456456456','654654654','XII TEL 07','1688355485075-cbr250rr.jpeg','Bekasi','2004-10-15','testformkuliahdankerja@gmail.com','+6286655443322','Jl. Bekasi Utara No. 2','Bekasi','Jawa Barat',2017,'TKJ','Kuliah dan Kerja',44),(64,'2147483647','112233445','','1688345507918-HondaVario160.png','Jakarta','2004-02-15','testulang@gmail.com','+6285644553355','Jl. Test Doang','Jakarta Pusat','DKI Jakarta',0,'RPL','Kuliah',49),(66,'678678678','456456456','XII TEL 12','1688362706962-hrv 1.png','Jakarta','2004-07-25','cobakuliah@gmail.com','+6289655776655','Jl. Coba Kuliah Utara','Jakarta Utara','DKI Jakarta',2018,'RPL','Kuliah',51),(67,'9999999','7777777','TAi','1688441161234-KtmDuke250.jpg','Got','2023-07-13','login@gmail.com','+634422323293','Jl. Daan Mogot Barat No. 20','Jakarta Barat','DKI Jakarta',2020,'TKJ','Kuliah',52),(69,'8866732','4321432','XII TEL 09','1689010986112-hrv 1.png','Jakarta','2005-11-19','rizkiaja@gmail.com','+6286677554466','Jl. Mangga Besar XIII','Jakarta Pusat','DKI Jakarta',2021,'RPL','Kuliah',68),(71,'112233','332211','XII TEL 07','1689012420654-alphardPutih.png','Bekasi','2004-02-13','testingimportsatu@gmail.com','+6289655664455','Jl. Testing Import Satu','Jakarta Barat','DKI Jakarta',2019,'RPL','Kerja',70),(72,'23213231','56454564','XII TEL 06','1689043710031-WIN_20221104_10_10_37_Pro (3).jpg','Jakarta','2004-07-11','testimporttiga@gmail.com','+6287766554477','Jl. Pademangan Timur No. 12','Jakarta Utara','DKI Jakarta',2019,'TKJ','Kuliah dan Kerja',73),(76,'123123123','321321321','XII TEL 07','1690041881533-Screenshot (133).png','Jakarta','2003-06-22','cobanama@gmail.com','+622323232323','asdfasjdlkf','Jakarta Barat','DKI Jakarta',2017,'TKJ','Kuliah',79),(77,'32323232','123123123','XII TEL 05','1690042035846-Screenshot (185).png','Bekasi','2004-06-22','cobanamalagi@gmail.com','+6285544332211','Jl. Ngasal','Jakarta Barat','DKI Jakarta',2018,'TJA','Kuliah',80),(78,'86868584','23425223','XII TEL 10','1690042275448-Screenshot (251).png','Jakarta','2003-07-22','testnama@gmail.com','+6286655445533','Jl. Test Nama No.12','Jakarta Timur','DKI Jakarta',2018,'TJA','Kuliah',81),(80,'323242123','432341232','XII TEL 01','1690165061171-Screenshot_20230224_071934.png','Jakarta','2004-02-24','thest@gmail.com','+6285644553322','Jl. Aasdfawrdaf','Jakarta Barat','DKI Jakarta',2018,'RPL','Wirausaha',83),(83,'1233234522','5374181238','XII TEL 08','1690333049939-Screenshot (245).png','Jakarta','2004-06-26','angka@gmail.com','+6284455663388','Jl. Mengkudu','Jakarta Barat','DKI Jakarta',2018,'TJA','Kerja',86),(86,'1235812319','5318238121','XII TEL 07','1690333927371-Screenshot (184).png','Jakarta','2004-06-26','anggur@gmail.com','+6289786567545','Jl. Anggur No. 12','Jakarta Timur','DKI Jakarta',2018,'RPL','Menganggur',88);
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wirausaha`
--

DROP TABLE IF EXISTS `wirausaha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wirausaha` (
  `id_wirausaha` int(11) NOT NULL AUTO_INCREMENT,
  `nama_usaha` varchar(150) NOT NULL,
  `bidang_usaha` varchar(150) NOT NULL,
  `alamat_usaha` varchar(255) NOT NULL,
  `kota_usaha` varchar(150) NOT NULL,
  `no_telp_usaha` varchar(15) NOT NULL,
  `tahun_mulai_usaha` int(4) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  PRIMARY KEY (`id_wirausaha`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `wirausaha_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wirausaha`
--

LOCK TABLES `wirausaha` WRITE;
/*!40000 ALTER TABLE `wirausaha` DISABLE KEYS */;
INSERT INTO `wirausaha` VALUES (3,'Peternakan Test Doang','Peternakan Hewan','Jl. Ternak No. 12','Jakarta Barat','+6289533443321',2021,39),(6,'Coba Dulu','Massa','Jl. Gak Tau','Jakarta Barat','+6285432154657',2022,80);
/*!40000 ALTER TABLE `wirausaha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-02  8:35:02

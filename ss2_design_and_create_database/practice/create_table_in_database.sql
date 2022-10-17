CREATE DATABASE IF NOT EXISTS quan_ly_diem_thi;
USE quan_ly_diem_thi;
--- TẠO BẢNG HỌC SINH ---
CREATE TABLE hoc_sinh(
ma_hs VARCHAR (20) PRIMARY KEY,
ten_hs VARCHAR(45),
ngay_sinh DATETIME,
lop VARCHAR(20),
gt VARCHAR (20)
);
--- TẠO BẢNG MÔN HỌC ---
CREATE TABLE mon_hoc(
ma_mh VARCHAR(20) PRIMARY KEY,
ten_mh VARCHAR(50)
);
--- TẠO BẢNG BẢNG ĐIỂM ---
CREATE TABLE bang_diem(
ma_hs VARCHAR (20),
ma_mh VARCHAR (20),
diem_thi INT,
ngay_kt DATETIME,
PRIMARY KEY (ma_hs, ma_mh),
CONSTRAINT FOREIGN KEY (ma_hs) REFERENCES hoc_sinh(ma_hs),
CONSTRAINT FOREIGN KEY(ma_mh) REFERENCES mon_hoc(ma_mh)
);
---  TẠO BẢNG GIÁO VIÊN ---
CREATE TABLE giao_vien(
ma_gv VARCHAR(20) PRIMARY KEY,
ten_gv VARCHAR(20),
sdt VARCHAR(20)
);
ALTER TABLE mon_hoc ADD ma_gv VARCHAR(20); 
ALTER TABLE mon_hoc ADD CONSTRAINT ma_gv FOREIGN KEY (ma_gv) REFERENCES giao_vien(ma_giao_vien);
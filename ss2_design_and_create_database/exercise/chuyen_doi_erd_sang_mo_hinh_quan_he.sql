CREATE DATABASE IF NOT EXISTS dat_hang;
USE dat_hang;
--- TẠO BẢNG PHIẾU XUẤT ---
CREATE TABLE phieu_xuat(
id_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
ngay_xuat DATETIME
);
--- TẠO BẢNG VẬT TƯ ---
CREATE TABLE vat_tu(
id_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
ten_vat_tu VARCHAR (30)
);
--- TẠO BẢNG CHI TIẾT PHIẾU XUẤT ---
CREATE TABLE chi_tiet_phieu_xuat (
don_gia_xuat DOUBLE,
so_luong_xuat INT,
id_phieu_xuat INT,
id_vat_tu INT,
PRIMARY KEY (id_phieu_xuat, id_vat_tu),
FOREIGN KEY (id_phieu_xuat) REFERENCES phieu_xuat(id_phieu_xuat),
FOREIGN KEY (id_vat_tu) REFERENCES vat_tu(id_vat_tu)
);
--- TẠO BẢNG PHIẾU NHẬP ---
CREATE TABLE phieu_nhap(
id_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
ngay_nhap DATETIME
);
--- TẠO BẢNG CHI TIẾT PHIẾU NHẬP ---
CREATE TABLE chi_tiet_phieu_nhap(
don_gia_nhap DOUBLE,
so_luong_nhap INT,
id_phieu_nhap INT,
id_vat_tu INT,
PRIMARY KEY (id_phieu_nhap, id_vat_tu),
FOREIGN KEY(id_phieu_nhap) REFERENCES phieu_nhap(id_phieu_nhap),
FOREIGN KEY(id_vat_tu) REFERENCES vat_tu(id_vat_tu)
);
--- TẠO BẢNG NHÀ CUNG CẤP ---
CREATE TABLE nha_cung_cap(
id_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
ten_nha_cung_cap VARCHAR (50),
dia_chi VARCHAR (50)
);
--- TẠO BẢNG SỐ ĐIỆN THOẠI ---
CREATE TABLE so_dien_thoai_nha_cung_cap(
so_dien_thoai VARCHAR (12) PRIMARY KEY,
id_nha_cung_cap INT,
FOREIGN KEY (id_nha_cung_cap) REFERENCES nha_cung_cap (id_nha_cung_cap)
);
--- TẠO BẢNG ĐƠN ĐẶT HÀNG ---
CREATE TABLE don_dat_hang(
id_dat_hang INT PRIMARY KEY AUTO_INCREMENT,
ngay_dat_hang DATETIME,
id_nha_cung_cap INT,
FOREIGN KEY(id_nha_cung_cap) REFERENCES nha_cung_cap (id_nha_cung_cap)
);
--- TẠO BẢNG CHI TIẾT ĐƠN ĐẶT HÀNG ---
CREATE TABLE chi_tiet_don_dat_hang(
id_dat_hang INT,
id_vat_tu INT,
PRIMARY KEY(id_dat_hang, id_vat_tu),
FOREIGN KEY(id_dat_hang) REFERENCES don_dat_hang(id_dat_hang),
FOREIGN KEY(id_vat_tu) REFERENCES vat_tu(id_vat_tu)
);
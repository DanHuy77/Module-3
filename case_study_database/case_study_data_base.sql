create database if not exists furama_resort;
use furama_resort;
create table vi_tri ( ma_vi_tri int primary key, ten_vi_tri varchar(45));
create table trinh_do ( ma_trinh_do int primary key, ten_trinh_do varchar (45));
create table bo_phan (ma_bo_phan int primary key, ten_bo_phan varchar(45));
--- Tạo bảng nhân viên ---
create table nhan_vien (
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar (45),
dia_chi varchar (45),
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
-------------------------------------------------------------
create table loai_khach( ma_loai_khach int primary key auto_increment, ten_loai_khach varchar(45));
--- Tạo bảng khách hàng ---
CREATE TABLE khach_hang(
ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach),
ho_ten VARCHAR(45),
ngay_sinh DATE,
gioi_tinh BIT(1),
so_cmnd VARCHAR(45),
so_dien_thoai VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR (45)
);
---------------------------------------------------------------
CREATE TABLE loai_dich_vu (ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT, ten_loai_dich_vu VARCHAR (45));
CREATE TABLE kieu_thue(ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT, ten_kieu_thue VARCHAR (45));
--- Tạo bảng dịch vụ ---
CREATE TABLE dich_vu (
ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu VARCHAR(45),
dien_tich INT,
chi_phi_thue DOUBLE,
so_nguoi_toi_da int,
FOREIGN KEY(ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
FOREIGN KEY(ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong VARCHAR(45) DEFAULT("Phòng thường"),
mo_ta_tien_nghi_khac VARCHAR(45),
dien_tich_ho_boi DOUBLE,
so_tang int,
dich_vu_mien_phi_di_kem TEXT
);
----------------------------------------------------------------
CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu_di_kem VARCHAR(45),
gia DOUBLE,
don_vi VARCHAR(10),
trang_thai VARCHAR(45)
);

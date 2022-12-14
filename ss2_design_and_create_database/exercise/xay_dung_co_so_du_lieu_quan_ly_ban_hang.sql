
CREATE DATABASE IF NOT EXISTS quan_ly_ban_hang;
USE quan_ly_ban_hang;
---  TẠO BẢNG CUSTOMER ---
CREATE TABLE customer(
c_ID INT PRIMARY KEY AUTO_INCREMENT,
c_name VARCHAR (50) NOT NULL,
c_age INT 
);
--- TẠO BẢNG `ORDER` ---
CREATE TABLE `order`(
o_ID INT PRIMARY KEY AUTO_INCREMENT,
o_date DATETIME,
o_total_price DOUBLE,
c_ID INT,
FOREIGN KEY(c_ID) REFERENCES customer(c_ID)
);
--- TẠO BẢNG PRODUCT ---
CREATE TABLE product(
p_id INT PRIMARY KEY AUTO_INCREMENT,
p_name VARCHAR (50),
p_price DOUBLE
);
--- TẠO BẢNG `ORDER` DETAIL ---
CREATE TABLE order_detail(
od_QTY INT,
o_id INT,
p_id INT,
PRIMARY KEY (o_id, p_id),
FOREIGN KEY(o_id) REFERENCES `order`(o_id),
FOREIGN KEY(p_id) REFERENCES product(p_id)
);

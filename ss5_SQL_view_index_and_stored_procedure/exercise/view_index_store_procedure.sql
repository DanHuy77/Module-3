CREATE DATABASE IF NOT EXISTS demo;
USE demo;
CREATE TABLE product(
ID int,
product_code VARCHAR (20),
product_name VARCHAR (50),
product_price DOUBLE,
product_amount INT,
product_description TEXT,
product_status BOOLEAN
);
--- BƯỚC 3 ---
INSERT INTO product VALUES(1, 'pro_01', 'dau_goi_dau', 150000, 1, 'bac_ha', true);
CREATE UNIQUE INDEX code_index ON product(product_code);
CREATE INDEX prod_name_price ON product(product_name, product_price);
EXPLAIN SELECT product_code FROM product;
EXPLAIN SELECT product_name, product_price FROM product;

--- BƯỚC 4 ---
CREATE VIEW prod_view AS
SELECT product_code, product_name, product_price, product_status FROM product;
SELECT * FROM prod_view;
UPDATE prod_view
SET product_status = false
WHERE product_code = 'pro_01';
DROP VIEW prod_view;

--- BƯỚC 5 ---
--- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product ---

DELIMITER //
CREATE PROCEDURE product_info()
BEGIN
SELECT * FROM product;
END //
DELIMITER ;

CALL product_info();

--- Tạo store procedure thêm một sản phẩm mới ---

DELIMITER //
CREATE PROCEDURE add_product(ID int, product_code VARCHAR(20), product_name VARCHAR (50), product_price DOUBLE, product_amount INT, product_description TEXT, product_status BOOLEAN)
BEGIN
INSERT INTO product VALUES(ID, product_code, product_name, product_price, product_amount, product_description, product_status);
END //
DELIMITER ;

call add_product(2,'pro_02', 'sua_tam', 100000, 2, 'ko_co_mo_ta', true);
SELECT * FROM product;

--- Tạo store procedure sửa thông tin sản phẩm theo id ---

DELIMITER //
CREATE PROCEDURE edit_product(p_ID INT, p_code VARCHAR(20), p_name VARCHAR (50), p_price DOUBLE, p_amount INT, p_description TEXT, p_status BOOLEAN)
BEGIN
UPDATE product SET product_code = p_code, 
product_name = p_name,
product_price = p_price,
product_amount = p_amount,
product_description = p_description,
product_status = p_status
WHERE ID = p_ID;
END //
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

CALL edit_product(2, 'pro_03', 'bia_larue', 15000, 24, 'bia_chai', true);
SELECT * FROM product;

--- Tạo store procedure xoá sản phẩm theo id ---

DELIMITER //
CREATE PROCEDURE delete_product(p_ID INT)
BEGIN
DELETE FROM product WHERE ID = p_ID;
END //
DELIMITER ;

CALL delete_product(1);
SELECT * FROM product;
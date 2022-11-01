USE furama_resort;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự. ---
SELECT * FROM nhan_vien WHERE ho_ten REGEXP('^[HTK]') AND (char_length(ho_ten) < 16);

-- Task 3 --

USE furama_resort;
SELECT * FROM 
khach_hang 
WHERE TIMESTAMPDIFF(YEAR,ngay_sinh,NOW()) >18 AND 
TIMESTAMPDIFF(YEAR,ngay_sinh,NOW()) <50 AND dia_chi REGEXP('(Quảng trị|Đà Nẵng)');

-- Task 4 --
SELECT hop_dong.ma_khach_hang, khach_hang.ho_ten, COUNT(hop_dong.ma_hop_dong) AS so_lan_dat_phong
 FROM khach_hang JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
 WHERE ma_loai_khach = 1 GROUP BY hop_dong.ma_khach_hang ORDER BY so_lan_dat_phong;
 
 -- Task 5 --
 
 SELECT 
 khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, 
 hop_dong.ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
 dich_vu.chi_phi_thue + SUM(IFNULL(dich_vu_di_kem.gia,0)*IFNULL( hop_dong_chi_tiet.so_luong,0)) AS tong_tien 
 FROM 
 khach_hang JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong, khach_hang.ma_khach_hang ORDER BY khach_hang.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3). --

SELECT dich_vu.*, ten_loai_dich_vu FROM dich_vu JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
 WHERE NOT EXISTS (SELECT * FROM hop_dong WHERE 
MONTH(ngay_lam_hop_dong) IN (1,2,3) AND YEAR(ngay_lam_hop_dong) = 2021 AND hop_dong.ma_dich_vu = dich_vu.ma_dich_vu);

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021. --

SELECT 
    dich_vu.ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    so_nguoi_toi_da,
    chi_phi_thue,
    ten_loai_dich_vu
FROM
    dich_vu
        JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE
    (YEAR(hop_dong.ngay_lam_hop_dong) = 2020
        AND (dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = 2021)))
GROUP BY dich_vu.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.--
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.--

-- Cách 1: GROUP BY---
SELECT khach_hang.ho_ten FROM khach_hang GROUP BY khach_hang.ho_ten;

-- Cách 2: UNION---
SELECT khach_hang.ho_ten FROM khach_hang
UNION
SELECT khach_hang.ho_ten FROM khach_hang;

-- Cách 3: DISTINCT --
SELECT DISTINCT khach_hang.ho_ten FROM khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. ---

SELECT 
    MONTH(ngay_lam_hop_dong) AS thang,
    COUNT(khach_hang.ma_khach_hang) AS so_luong_khach_dat_phong
FROM
    khach_hang
        JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY thang ORDER BY thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. ---
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem). ---

SELECT 
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    hop_dong.tien_dat_coc,
    IFNULL(SUM(hop_dong_chi_tiet.so_luong),0) AS so_luong_dich_vu_di_kem
FROM
    hop_dong
       LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong ORDER BY hop_dong.ma_hop_dong;


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”. ---

SELECT 
    *
FROM
    dich_vu_di_kem
        JOIN
    hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    hop_dong ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        JOIN
    khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE
    khach_hang.ma_loai_khach = 1
        AND (khach_hang.dia_chi REGEXP ('Vinh')
        OR khach_hang.dia_chi REGEXP ('Quảng Ngãi'));
        
        
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, --- 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), --- 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021. ---

SELECT 
    hop_dong.ma_hop_dong,
    nhan_vien.ho_ten AS ten_nhan_vien,
    khach_hang.ho_ten AS ten_khach_hang,
    khach_hang.so_dien_thoai,
    dich_vu.ten_dich_vu,
    IFNULL(SUM(hop_dong_chi_tiet.so_luong), 0) AS so_luong_dich_vu_di_kem,
    hop_dong.tien_dat_coc
FROM
    hop_dong
         JOIN
    nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
         JOIN
    khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
         JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
WHERE
	YEAR(hop_dong.ngay_lam_hop_dong) = 2020 AND MONTH(hop_dong.ngay_lam_hop_dong) IN (10,11,12)
    AND NOT EXISTS(SELECT hop_dong.ngay_lam_hop_dong WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021 AND MONTH(hop_dong.ngay_lam_hop_dong) IN (1,2,3,4,5,6))
GROUP BY khach_hang.ho_ten;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau). ---

CREATE OR REPLACE VIEW so_luong_2 AS
    SELECT 
        dich_vu_di_kem.*,
        SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem
    FROM
        hop_dong_chi_tiet
            JOIN
        dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
    GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
    HAVING SUM(hop_dong_chi_tiet.so_luong) >= ALL (SELECT 
            SUM(hop_dong_chi_tiet.so_luong)
        FROM
            hop_dong_chi_tiet GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem );

SELECT 
    *
FROM
    so_luong_2;


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. ---
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem). ---

SELECT 
    hop_dong.ma_hop_dong,
    loai_dich_vu.ten_loai_dich_vu,
    dich_vu_di_kem.ten_dich_vu_di_kem,
    COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    dich_vu_di_kem
        JOIN
    hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem
HAVING (COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) = 1) ORDER BY hop_dong.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ---
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021. ---

SELECT 
    nhan_vien.ma_nhan_vien,
    nhan_vien.ho_ten,
    trinh_do.ten_trinh_do,
    bo_phan.ten_bo_phan,
    nhan_vien.so_dien_thoai,
    nhan_vien.dia_chi
FROM
    nhan_vien
        JOIN
    trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
        JOIN
    bo_phan ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
    JOIN hop_dong ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
    WHERE YEAR(ngay_lam_hop_dong) IN (2020,2021)
    GROUP BY nhan_vien.ma_nhan_vien
    HAVING COUNT(hop_dong.ma_hop_dong) <=3
    ORDER BY nhan_vien.ma_nhan_vien;
    
    -- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021. ---
    SELECT 
    nhan_vien.ma_nhan_vien, nhan_vien.ho_ten
FROM
    nhan_vien
WHERE nhan_vien.ma_nhan_vien NOT IN (SELECT 
        hop_dong.ma_nhan_vien
    FROM
        hop_dong
    WHERE
        (YEAR(hop_dong.ngay_lam_hop_dong) = 2019
            OR YEAR(hop_dong.ngay_lam_hop_dong) = 2020
            OR YEAR(hop_dong.ngay_lam_hop_dong) = 2021)
    GROUP BY hop_dong.ma_nhan_vien)
;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, ---
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. ---
UPDATE khach_hang kh 
SET 
    kh.ma_loai_khach = 1
WHERE
    kh.ma_khach_hang IN (SELECT
    b.mkh
    FROM
    (SELECT 
            a.mkh mkh, SUM(a.tong_tien) tong
        FROM
            (SELECT 
                hop_dong.ma_khach_hang mkh,
                    (IFNULL(dich_vu.chi_phi_thue, 0) + IFNULL(SUM(IFNULL(hop_dong_chi_tiet.so_luong, 0) * IFNULL(dich_vu_di_kem.gia, 0)), 0)) AS tong_tien
            FROM
                hop_dong
            LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
            LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
            LEFT JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
            LEFT JOIN khach_hang kh ON kh.ma_khach_hang = hop_dong.ma_khach_hang
            WHERE
                YEAR(hop_dong.ngay_lam_hop_dong) = 2021
            GROUP BY hop_dong.ma_hop_dong) a
                JOIN
            khach_hang kh ON a.mkh = kh.ma_khach_hang
        WHERE
            ma_loai_khach = 2
        GROUP BY mkh)b WHERE tong>1000000);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng). ---
SELECT 
    khach_hang.ma_khach_hang, khach_hang.ho_ten
FROM
    khach_hang
        JOIN
    hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
WHERE
    (YEAR(hop_dong.ngay_lam_hop_dong) < 2021);
    
    -- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi. ---
  
  UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    dich_vu_di_kem.ma_dich_vu_di_kem = (SELECT 
            hop_dong_chi_tiet.ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet
                JOIN
            hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = 2020
        GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
        HAVING SUM(hop_dong_chi_tiet.so_luong) > 10);
        
        -- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
		-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi. ---
        
SELECT ma_nhan_vien AS ID, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi FROM nhan_vien
UNION
SELECT ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi FROM khach_hang;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Đà Nẵng” --- 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”. ---

CREATE OR REPLACE VIEW v_nhan_vien AS
    SELECT 
        nhan_vien.*
    FROM
        nhan_vien
            JOIN
        hop_dong ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
    WHERE
        nhan_vien.dia_chi REGEXP ('Đà Nẵng')
            AND MONTH(hop_dong.ngay_lam_hop_dong) = 4
            GROUP BY nhan_vien.ma_nhan_vien;
            
DROP VIEW v_nhan_vien;
SELECT * FROM v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này. ---

UPDATE nhan_vien
SET
    dia_chi = 'Liên Chiểu'
WHERE
    ma_nhan_vien IN (SELECT
            ma_nhan_vien
        FROM
            v_nhan_vien);
            
 SET SQL_SAFE_UPDATES = 0;
 
 
--- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang. ---

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(ID INT)
BEGIN
DELETE FROM khach_hang WHERE ma_khach_hang = ID;
END //
DELIMITER ;

 SET SQL_SAFE_UPDATES = 0;

-- 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu ---
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính ---
-- và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan. ---

CREATE TABLE incorrect_input (thong_bao_loi TEXT);
DROP TABLE incorrect_input;

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong (ma_hop_dong INT,
 ngay_lam_hop_dong DATETIME, 
 ngay_ket_thuc DATETIME,
 tien_dat_coc DOUBLE,
 ma_nhan_vien INT,
 ma_khach_hang INT,
 ma_dich_vu INT)
 BEGIN

 IF ma_hop_dong IN (SELECT hop_dong.ma_hop_dong FROM hop_dong) 
 OR ma_nhan_vien NOT IN (SELECT nhan_vien.ma_nhan_vien FROM nhan_vien) 
 OR ma_dich_vu NOT IN (SELECT dich_vu.ma_dich_vu FROM dich_vu) THEN 
 INSERT INTO incorrect_input VALUES('ma_hop_dong da ton tai hoac ma_nhan_vien chua ton tai hoac ma_dich_vu chua ton tai, ko the nhap');
 ELSE
 INSERT INTO hop_dong VALUES(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu);
 END IF;
 END //
 DELIMITER ;
 
 -- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
 -- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database

--  DELIMITER //
--  CREATE TRIGGER tr_xoa_hop_dong AFTER DELETE ON hop_dong
--  FOR EACH ROW 
--  BEGIN
--  -- DECLARE msg INT;
-- --  DECLARE output_msg VARCHAR(128);
-- -- SET msg = (SELECT COUNT(hop_dong.ma_hop_dong) FROM hop_dong);
-- -- SET output_msg = (SELECT CONVERT(output_msg, CHAR)) ; 
-- SIGNAL SQLSTATE VALUE '00000'
-- SET MESSAGE_TEXT = 'asd';
-- END //
-- DELIMITER ;

-- DROP TRIGGER tr_xoa_hop_dong;

-- DELETE FROM hop_dong WHERE hop_dong.ma_hop_dong = 12;

-- INSERT INTO hop_dong
--   (ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
-- VALUES (12,'2021-05-25','2021-05-27',0,7,10,1);

CREATE TABLE so_luong_ban_ghi(
so_luong_ban_ghi INT,
delete_day DATETIME DEFAULT NOW()); 
DELIMITER //
CREATE TRIGGER xoa_hop_dong
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
INSERT INTO so_luong_ban_ghi(so_luong_ban_ghi)
SELECT COUNT(*) FROM hop_dong;
END//
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0; 
DELETE FROM hop_dong 
	WHERE hop_dong.ma_hop_dong = 1;
DELETE FROM hop_dong 
	WHERE hop_dong.ma_hop_dong = 2;
SELECT * FROM so_luong_ban_ghi;
DROP TRIGGER xoa_hop_dong;


-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
-- Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
-- Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo 
-- “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.

CREATE TABLE ngay_lam_hop_dong

DELIMITER //
CREATE TRIGGER tr_cap_nhat_hop_dong 
BEFORE UPDATE ON hop_dong
FOR EACH ROW
BEGIN 
IF DATEDIFF(NEW.ngay_ket_thuc, OLD.ngay_lam_hop_dong) < 2
THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
END IF;
END //
DELIMITER ;
DROP TRIGGER tr_cap_nhat_hop_dong;
UPDATE hop_dong SET ngay_ket_thuc = '2021-04-28' WHERE hop_dong.ma_hop_dong = 12;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 200.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng 
-- đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ 
-- (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.

-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
DELIMITER //
CREATE FUNCTION func_dem_dich_vu ()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE so_luong_su_dung INT;
SET so_luong_su_dung = 
(SELECT 
    COUNT(hop_dong.ma_dich_vu) FROM hop_dong JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu WHERE dich_vu.chi_phi_thue > 2000000);
RETURN so_luong_su_dung;
END //
DELIMITER ;

DROP FUNCTION func_dem_dich_vu;
SELECT func_dem_dich_vu() AS so_dich_vu;

-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng 
-- đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ 
-- (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.

DELIMITER //
CREATE FUNCTION func_tinh_thoi_gian_max_hop_dong(ma_khach_hang INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE khoang_thoi_gian_theo_ngay INT;
SET khoang_thoi_gian_theo_ngay =(SELECT MAX(DATEDIFF(hop_dong.ngay_ket_thuc, hop_dong.ngay_lam_hop_dong)) FROM hop_dong WHERE hop_dong.ma_khach_hang = ma_khach_hang);
RETURN khoang_thoi_gian_theo_ngay;
END //
DELIMITER ;
DROP FUNCTION func_tinh_thoi_gian_max_hop_dong;
SELECT func_tinh_thoi_gian_max_hop_dong(3) AS khoang_thoi_gian_theo_ngay;


-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ 
-- là “Room” từ đầu năm 2020 đến hết năm 2021 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) 
-- và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

DELIMITER //
CREATE PROCEDURE sp_xoa_dich_vu_va_hd_room()
BEGIN
DELETE FROM hop_dong, dich_vu, hop_dong_chi_tiet USING hop_dong_chi_tiet JOIN hop_dong JOIN dich_vu 
WHERE dv.ma_loai_dich_vu = 3 AND dv.ma_dich_vu IN (SELECT dv.ma_dv FROM dich_vu dv JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu 
WHERE YEAR(hd.ngay_lam_hop_dong) IN (2020,2021));
END //
DELIMITER ;
DROP PROCEDURE sp_xoa_dich_vu_va_hd_room;
CALL sp_xoa_dich_vu_va_hd_room();
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM hop_dong;
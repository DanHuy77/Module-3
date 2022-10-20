USE furama_resort;
--- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”. ---

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
        
        
--- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, --- 
--- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), --- 
--- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021. ---

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

--- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau). ---

CREATE VIEW so_luong_2 AS
    SELECT 
        dich_vu_di_kem.*,
        SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem
    FROM
        hop_dong_chi_tiet
            JOIN
        dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
    GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
    HAVING SUM(hop_dong_chi_tiet.so_luong) = (SELECT 
            MAX(hop_dong_chi_tiet.so_luong)
        FROM
            hop_dong_chi_tiet);

SELECT 
    *
FROM
    so_luong_2;


--- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. ---
--- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem). ---

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

--- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ---
--- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021. ---

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
    
    --- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021. ---
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

--- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, ---
--- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. ---

SELECT hop_dong.ma_dich_vu, hop_dong.ma_khach_hang, khach_hang.ho_ten, hop_dong.ngay_lam_hop_dong FROM hop_dong JOIN khach_hang ON
hop_dong.ma_khach_hang = khach_hang.ma_khach_hang WHERE YEAR(ngay_lam_hop_dong) = 2021;

  SELECT 
 khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ma_loai_khach, 
 hop_dong.ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
 (IFNULL(dich_vu.chi_phi_thue,0) + SUM(IFNULL(dich_vu_di_kem.gia,0)*IFNULL( hop_dong_chi_tiet.so_luong,0))) AS tong_tien 
 FROM 
 khach_hang JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021 AND loai_khach.ma_loai_khach = 1
GROUP BY khach_hang.ma_khach_hang, hop_dong.ma_hop_dong HAVING tong_tien > 1000000  ORDER BY khach_hang.ma_khach_hang;
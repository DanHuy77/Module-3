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

    SELECT 
            SUM(hop_dong_chi_tiet.so_luong) AS so_luong_su_dung_dich_vu_di_kem
        FROM
            dich_vu_di_kem
                LEFT JOIN
            hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem;
        
        
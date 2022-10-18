USE furama_resort;
SELECT hop_dong.ma_khach_hang, khach_hang.ho_ten, COUNT(hop_dong.ma_hop_dong) AS so_lan_dat_phong
 FROM khach_hang JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang WHERE ma_loai_khach = 1 GROUP BY hop_dong.ma_khach_hang ORDER BY so_lan_dat_phong;
 
 --- Task 5 ---
 SELECT 
 khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, 
 hop_dong.ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
 (IFNULL(dich_vu.chi_phi_thue,0) + SUM(IFNULL(dich_vu_di_kem.gia,0)*IFNULL( hop_dong_chi_tiet.so_luong,0))) AS tong_tien 
 FROM 
 khach_hang JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
GROUP BY khach_hang.ma_khach_hang, hop_dong.ma_hop_dong ORDER BY khach_hang.ma_khach_hang;
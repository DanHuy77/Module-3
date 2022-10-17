USE furama_resort;
SELECT ma_nhan_vien, ho_ten FROM nhan_vien WHERE ho_ten REGEXP('^[HKT]') AND (char_length(ho_ten) < 16);
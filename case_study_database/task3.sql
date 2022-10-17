USE furama_resort;
SELECT * FROM khach_hang WHERE TIMESTAMPDIFF(YEAR,ngay_sinh,NOW()) >18 AND TIMESTAMPDIFF(YEAR,ngay_sinh,NOW()) <50 AND dia_chi REGEXP('(Quảng trị|Đà Nẵng)');
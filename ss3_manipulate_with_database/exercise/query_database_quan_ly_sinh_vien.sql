USE quan_ly_sinh_vien;
--- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ ---
SELECT * FROM student WHERE student_name REGEXP("^[H]");
--- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12 ---
SELECT * FROM class WHERE MONTH(start_date) = 12;
--- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5 ---
SELECT 
    *
FROM
    `subject`
WHERE
    credit <= 3 AND credit >= 5;
--- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2. ---
SET SQL_SAFE_UPDATES = 0;
UPDATE student SET class_ID = 2 WHERE student_name REGEXP("Hung");
--- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.---
SELECT 
    student_name, mark, sub_name
FROM
    student
        INNER JOIN
    student_mark ON student.student_ID = student_mark.student_ID
        JOIN
    `subject` ON `subject`.sub_ID = student_mark.sub_ID
ORDER BY mark DESC , student_name;
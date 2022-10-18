USE quan_ly_sinh_vien;
--- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất. ---
SELECT * FROM `subject` WHERE `subject`.credit = (SELECT MAX(credit) FROM `subject`);

--- Hiển thị các thông tin môn học có điểm thi lớn nhất.---
SELECT student_mark.mark, `subject`.* 
FROM student_mark JOIN `subject` 
ON student_mark.sub_ID = `subject`.sub_ID
WHERE student_mark.mark = (SELECT MAX(mark) FROM student_mark);

--- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần ---
SELECT student.*, AVG(student_mark.mark) AS avg_mark 
FROM 
student JOIN student_mark ON student.student_ID = student_mark.student_ID
GROUP BY student.student_ID, student.student_name ORDER BY avg_mark DESC;
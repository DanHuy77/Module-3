USE quan_ly_sinh_vien;
SELECT *
FROM student;

SELECT *
FROM student
WHERE status = true;

SELECT *
FROM subject
WHERE credit < 10;

SELECT student.student_ID, student.student_name, class.class_name
FROM student student join class class on student.class_ID = class.class_ID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';
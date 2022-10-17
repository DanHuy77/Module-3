CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
--- TẠO BẢNG CLASS ---
CREATE TABLE class(
class_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
class_name VARCHAR(60) NOT NULL,
start_date DATETIME NOT NULL,
status BIT
);
--- TẠO BẢNG STUDENT ---
CREATE TABLE student(
student_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(30) NOT NULL,
address VARCHAR(50),
phone VARCHAR(20),
status BIT,
class_ID INT NOT NULL,
FOREIGN KEY (class_ID) REFERENCES class(class_ID)
);
--- TẠO BẢNG `SUBJECT` ---
CREATE TABLE `subject`(
sub_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(30) NOT NULL,
credit TINYINT NOT NULL DEFAULT 1 CHECK(credit >=1),
status BIT DEFAULT 1
);
--- TẠO BẢNG MARK ---
CREATE TABLE student_mark(
mark_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
sub_ID INT NOT NULL,
student_ID INT NOT NULL,
mark FLOAT DEFAULT 0 CHECK(mark BETWEEN 0 AND 100),
exam_times TINYINT DEFAULT 1,
FOREIGN KEY (sub_ID) REFERENCES `subject`(sub_ID),
FOREIGN KEY (student_ID) REFERENCES student (student_ID)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_ID)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, phone, status, class_ID)
VALUES ('Hoa', 'Hai phong', null, 1, 1);
INSERT INTO student (student_name, address, phone, status, class_ID)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO student_mark (sub_ID, student_ID, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
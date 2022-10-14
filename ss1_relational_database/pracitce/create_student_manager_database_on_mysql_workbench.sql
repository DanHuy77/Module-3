create database if not exists StudentManager;
use StudentManager;
create table student(
id int primary key,
fullname varchar(30),
age int,
country varchar(30)
);
insert into student(id, fullname, age, country) value
(1, 'Huy', 26, 'VN');
select * from student;
create database if not exists student_management;
use student_management;
create table teacher (
id int primary key,
`name` varchar(30),
age int,
country varchar(30)
);
create table class (
id int primary key,
`name` varchar(30)
);

insert into class (id, `name`) value (1, 'C0722G1');
insert into teacher(id, `name`, age, country) value (1, 'Huy', 26, "VN");
select * from class;
select * from teacher;
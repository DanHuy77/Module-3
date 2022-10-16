create database if not exists code_gym;
use code_gym;
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

insert into Class (id, `name`) value (1, 'C0722G1');
insert into Teacher(id, `name`, age, country) value (1, 'Huy', 26, "VN");
select * from Class;
select * from Teacher;
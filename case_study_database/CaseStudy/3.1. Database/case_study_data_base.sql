create database if not exists furama_resort;
use furama_resort;
create table position_ (position_code int primary key, position_name varchar(45));
create table edu_level (edu_level_code int primary key, edu_level_name varchar (45));
create table department (department_code int primary key, department_name varchar(45));
-- Tạo bảng nhân viên --
create table staff (
staff_code int auto_increment primary key,
full_name varchar(45),
birthday date,
ID_number varchar(45),
salary double,
telephone varchar(45),
email varchar (45),
address varchar (45),
position_code int,
edu_level_code int,
department_code int,
foreign key(position_code) references position_(position_code),
foreign key(edu_level_code) references edu_level(edu_level_code),
foreign key(department_code) references department(department_code)
);
-------------------------------------------------------------


create table customer_type( customer_type_code int primary key auto_increment, customer_type_name varchar(45));


-- Tạo bảng khách hàng --
CREATE TABLE customer(
customer_code INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(45),
birthday DATE,
gender BIT(1),
ID_number VARCHAR(45),
telephone VARCHAR(45),
email VARCHAR(45),
address VARCHAR (45),
customer_type_code INT,
FOREIGN KEY (customer_type_code) REFERENCES customer_type(customer_type_code)
);
---------------------------------------------------------------

CREATE TABLE service_type (service_type_code INT PRIMARY KEY AUTO_INCREMENT, service_type_name VARCHAR (45));



CREATE TABLE rental_type(rental_type_code INT PRIMARY KEY AUTO_INCREMENT, rental_type_name VARCHAR (45));



-- Tạo bảng dịch vụ --
CREATE TABLE service (
service_code INT PRIMARY KEY AUTO_INCREMENT,
service_name VARCHAR(45),
area INT,
rental_cost DOUBLE,
maximum_user int,
room_standard VARCHAR(45),
other_description VARCHAR(45),
pool_area DOUBLE,
floor_number int,
free_service TEXT,
rental_type_code int,
service_type_code int,
FOREIGN KEY(rental_type_code) REFERENCES rental_type(rental_type_code),
FOREIGN KEY(service_type_code) REFERENCES service_type(service_type_code)
);
----------------------------------------------------------------
CREATE TABLE attached_service(
attached_service_code INT PRIMARY KEY AUTO_INCREMENT,
attached_service_name VARCHAR(45),
cost DOUBLE,
unit VARCHAR(10),
service_status VARCHAR(45)
);
-- Tạo bảng hợp đồng --
CREATE TABLE contract(
contract_code INT PRIMARY KEY AUTO_INCREMENT,
contract_begin_date DATETIME,
contract_end_date DATETIME,
deposit DOUBLE,
staff_code int,
customer_code int,
service_code int,
FOREIGN KEY(staff_code) REFERENCES staff(staff_code) ON DELETE CASCADE,
FOREIGN KEY(customer_code) REFERENCES customer(customer_code) ON DELETE CASCADE,
FOREIGN KEY(service_code) REFERENCES service(service_code) ON DELETE CASCADE
);
-- Tạo bảng hợp đồng chi tiết --
CREATE TABLE detail_contract (
detail_contract_code INT PRIMARY KEY AUTO_INCREMENT,
contract_code INT,
attached_service_code INT,
FOREIGN KEY (contract_code) REFERENCES contract(contract_code) ON DELETE CASCADE,
FOREIGN KEY(attached_service_code) REFERENCES attached_service(attached_service_code),
quanity INT
);
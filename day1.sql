create database ecommercedb;

use ecommercedb;

-- CUSTOMER TABLE

create table customers(
customer_id int auto_increment primary key,
first_name varchar(30),
last_name varchar(20),
email varchar(40) unique,
phone_number varchar(12),
address varchar(30),
city varchar(20),
state varchar(20),
zip_code varchar(20),
created_at timestamp default current_timestamp);

-- PRODUCT TABLE 
create table products(
product_id int auto_increment primary key,
name varchar(50),
description text,
price decimal (10,2),
stock_quantity int,
created_at timestamp default current_timestamp);


-- ORDER TABLE 
create table orders(
order_id int auto_increment primary key,
customer_id int,
order_date timestamp default current_timestamp,
status varchar(20),
foreign key (customer_id) references customers(customer_id)); 

-- ORDER ITEMS TABLE 
create table order_items(
order_id int,
product_id int,
quantity int,
price decimal(10,2),
primary key (order_id , product_id),
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id)); 

-- PAYMENT TABLE
create table payments(
payment_id int auto_increment primary key,
order_id int,
payment_date timestamp default current_timestamp,
amount decimal(10,2),
method varchar(30),
foreign key (order_id) references orders(order_id)); 

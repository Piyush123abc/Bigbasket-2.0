create database if not exists bigbasket2;
use bigbasket2;

-- Customer Detail Table
create table if not exists customer_detail(
    customer_id int primary key auto_increment,
    cus_name varchar(30),
    cus_phone_no varchar(12),
    cus_address varchar(40)
) auto_increment=1;

-- Product Detail Table
create table if not exists product_detail(
    product_id int primary key auto_increment,
    product_name varchar(35),
    product_type enum("electronics","food","cloths","pharmacy","furniture"),
    supplier_id int,
    foreign key (supplier_id) references supplier_detail(supplier_id)
) auto_increment=1;

-- Order Detail Table
create table if not exists order_detail(
    customer_id int,
    product_id int,
    quantity int,
    parcel_id int,
    foreign key (customer_id) references customer_detail(customer_id),
    foreign key (product_id) references product_detail(product_id),
    foreign key (parcel_id) references parcel_detail(parcel_id)
);

-- Parcel Detail Table
create table if not exists parcel_detail(
    parcel_id int primary key auto_increment,
    delivery_id int,
    foreign key (delivery_id) references delivery_detail(delivery_id)
) auto_increment=1;

-- Delivery Detail Table
create table if not exists delivery_detail(
    delivery_id int primary key auto_increment,
    delivery_date date,
    gps_id varchar(25)
) auto_increment=1;

-- Payment Table
create table if not exists payment_detail(
    payment_method varchar(30),
    acc_no varchar(20),
    payment_status enum("Payment successful","Payment pending", "Payment failed") default 'Payment pending',
    total_amount int,
    parcel_id int,
    foreign key(parcel_id) references parcel_detail(parcel_id)
);

-- Supplier Detail Table
create table if not exists supplier_detail(
    supplier_id int primary key auto_increment,
    sup_address varchar(35),
    sup_phone_no varchar(12)
) auto_increment=1;
 
 
 INSERT INTO customer_detail (cus_name, cus_phone_no, cus_address)
VALUES
("Piyush", "1234567891", "Behind Sudar Vihar"),
("Aditya", "4356177892", "At the surface of the sun"),
("Naruto", "1061061061", "Leaf Village"),
("Eren", "1591591591", "Paradis"),
("Tanjiro", "6666666666", "Shinobu Residents"),
("Light", "9999999999", "Tokyo"),
("Saitama", "1231231231", "City Z"),
("Levi", "1010101010", "Wall Maria"),
("Kakashi", "1070501410", "Leaf Village Residents, KH");

 truncate table supplier_detail;
 SET FOREIGN_KEY_CHECKS = 1;
 insert into supplier_detail (sup_address,sup_phone_no)
 values
 ("45B stark indusrty,Silicon Valley", "1234567890"),
("101 FreshFood, New York", "9876543210"),
("007 kingsmen, Paris", "5556667771"),
("99 PharmaPlus, London", "4445556667"),
("12 Oak works, Berlin", "1112223333");
 
 
 
 
 INSERT INTO product_detail (product_name, product_type, supplier_id)
VALUES
("Apple MacBook Pro", "electronics", 1),
("Whole Wheat Bread", "food", 2),
("Leather Jacket", "cloths", 3),
("Cough Syrup", "pharmacy", 4),
("Ergonomic Office Chair", "furniture", 5),
("Sony 4K TV", "electronics", 1),
("Gluten-Free Pasta", "food", 2),
("Winter Coat", "cloths", 3),
("Vitamin C Tablets", "pharmacy", 4),
("Queen Size Bed Frame", "furniture", 5);



INSERT INTO delivery_detial(delivery_date, gps_id)
VALUES 
('2024-10-01', 'GPS12345678'),
('2024-10-01', 'GPS87654321'),
('2024-10-03', 'GPS56781234');

 use bigbasket2;
 select * from product_detail;
 
 
 
 
 

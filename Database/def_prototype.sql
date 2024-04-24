--create database
drop if exists database gym
create database gym
\c gym

-- Tạo bảng Package
CREATE TABLE Package (
    package_id INT NOT NULL PRIMARY KEY,
    package_name VARCHAR(100),
    package_duration VARCHAR(20),
    package_price FLOAT,
    package_sale INT
);

-- Tạo bảng Employee
CREATE TABLE Employee (
    employee_id INT NOT NULL PRIMARY KEY,
    employee_email VARCHAR(50) NOT NULL,
    employee_password VARCHAR(50) NOT NULL,
    employee_name VARCHAR(50) NOT NULL,
    employee_role VARCHAR(20) NOT NULL
);

-- Tạo bảng Register
CREATE TABLE Register (
    register_id INT NOT NULL PRIMARY KEY,
    member_id INT NOT NULL,
    package_id INT NOT NULL,
    register_status VARCHAR(50),
    register_time TIME,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (package_id) REFERENCES Package(package_id)
);

-- Tạo bảng Member
CREATE TABLE Member (
    member_id INT NOT NULL PRIMARY KEY,
    member_email VARCHAR(50) NOT NULL,
    member_password VARCHAR(50) NOT NULL,
    member_name VARCHAR(50) NOT NULL,
    member_dob DATE,
    member_address VARCHAR(200),
    member_phone_number VARCHAR(15)
);

-- Tạo bảng Feedback
CREATE TABLE Feedback (
    feedback_id INT NOT NULL PRIMARY KEY,
    member_id INT NOT NULL,
    employee_id INT,
    room_id INT,
    time TIME,
    description TEXT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- Tạo bảng Equipment
CREATE TABLE Equipment (
    equipment_id INT NOT NULL PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    equipment_count INT,
    equipment_condition VARCHAR(15),
    room_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- Tạo bảng Access
CREATE TABLE Access (
    access_id INT NOT NULL PRIMARY KEY,
    room_id INT NOT NULL,
    package_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Room(room_id),
    FOREIGN KEY (package_id) REFERENCES Package(package_id)
);

-- Tạo bảng Room
CREATE TABLE Room (
    room_id INT NOT NULL PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL
);

-- view

-- function

-- trigger
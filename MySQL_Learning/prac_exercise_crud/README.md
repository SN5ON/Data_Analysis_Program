🚲 Bike Rental Shop Database Project
A relational database project built from scratch using MySQL to manage a local bike rental shop. This project demonstrates core SQL concepts including schema design, data types, constraints, primary/foreign keys, and CRUD operations (Create, Read/Update, Delete).

🏗️ 1. Database Schema Design
The database consists of three related tables enforcing relational integrity through Primary and Foreign keys:

-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL
);

-- 2. Bikes Table
CREATE TABLE bikes (
    bike_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    bike_type VARCHAR(50) NOT NULL, -- Avoids reserved keyword 'type'
    daily_rental_rate DECIMAL(10, 2) NOT NULL,
    availability_status ENUM('available', 'rented', 'maintenance') NOT NULL DEFAULT 'available'
);

-- 3. Rentals Table (Transaction / Junction Table)
CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    bike_id INT NOT NULL,
    start_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    actual_return_date DATE NULL,
    total_amount_charged DECIMAL(10, 2) NULL,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_rentals_customer 
        FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id),
        
    CONSTRAINT fk_rentals_bike 
        FOREIGN KEY (bike_id) 
        REFERENCES bikes(bike_id)
);

📝 2. Data Manipulation Language (DML) Operations
Inserting Sample Data

-- Insert Customers
INSERT INTO customers (full_name, email_address, date_of_birth) 
VALUES ('Robertson Andy', 'A.Robertson@spurs.com', '1988-08-19');

INSERT INTO customers (full_name, email_address, date_of_birth) 
VALUES ('Mathaues Tels', 'M.Tels@spurs.com', '1989-05-19');

-- Insert Bikes
INSERT INTO bikes (brand, bike_type, daily_rental_rate, availability_status) 
VALUES ('Trek', 'Road', 12.50, 'available');

-- Insert Rentals (Linked via Foreign Keys)
INSERT INTO rentals (customer_id, bike_id, start_date, expected_return_date, actual_return_date, total_amount_charged) 
VALUES (1, 1, '2026-05-19', '2026-05-29', '2026-05-31', 37.50);

Updating Records:
-- Updating a rental record when a bike is returned
UPDATE rentals
SET actual_return_date = '2026-05-25', total_amount_charged = 37.60 
WHERE rental_id = 1;
Deleting Records:
-- Safely deleting a rental record
DELETE FROM rentals 
WHERE rental_id = 1;
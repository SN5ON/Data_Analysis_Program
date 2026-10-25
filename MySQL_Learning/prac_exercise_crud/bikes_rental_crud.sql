INSERT INTO customers (full_name, email_address, date_of_birth) 
VALUES ('Robertson Andy', 'A.Robertson@spurs.com', '1988-08-19');

INSERT INTO customers (full_name, email_address, date_of_birth) 
VALUES ('Mathaues Tels', 'M.Tels@spurs.com', '1989-05-19');

-- 1. Corrected Bike Insert (using 'available' or letting it default)
INSERT INTO bikes (brand, bike_type, daily_rental_rate, availability_status) 
VALUES ('Trek', 'Road', 12.50, 'available');

-- 2. Corrected Rental Insert (including customer_id and bike_id)
INSERT INTO rentals (customer_id, bike_id, start_date, expected_return_date, actual_return_date, total_amount_charged) 
VALUES (1, 1, '2026-05-19', '2026-05-29', '2026-05-31', 37.50);

UPDATE rentals
SET actual_return_date = '2026-05-25', total_amount_charged = 37.60 
WHERE rental_id = 1;

DELETE FROM rentals 
WHERE rental_id = 1;
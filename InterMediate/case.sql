use inter;

CREATE TABLE payment (
    c_id INT,
    camount DECIMAL(10, 2),
    mode VARCHAR(20),
    payment_date DATE
);

INSERT INTO payment
VALUES
(101, 2500.00, 'UPI', '2025-07-20'),
(102, 1500.50, 'Credit Card', '2025-07-21'),
(103, 3200.00, 'Cash', '2025-07-22'),
(104, 4000.75, 'Debit Card', '2025-07-23'),
(105, 1800.00, 'UPI', '2025-07-24');

select * from payment;

select c_id,camount,
CASE
	when camount>2000 then "expensive"
    when camount>1600 then "moderate"
    else "Inexpensive"
end as product_status
from payment;

/* case expression*/

select c_id,
case camount
	when 2500 then 'prime customer'
    when 1000 then 'plus customer'
    else 'regular customer'
end as satus
from payment;
use inter;
show tables;

CREATE TABLE dumy (
    id INT,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    salary VARCHAR(20),
    department VARCHAR(50)
);

INSERT INTO Dumy (id, name, email, phone, salary, department) VALUES
(1, '  John  ', 'JOHN@example.com', ' 1234567890 ', '50000', 'Sales'),
(2, 'Sara', 'sara@example.com', NULL, 'null', ' HR '),
(3, 'Mike', 'mike@EXAMPLE.com', '9876543210', '60000', NULL),
(4, 'Sara', 'sara@example.com', NULL, 'null', ' HR '), -- Duplicate row
(5, NULL, 'jack@example.com', ' 0987654321', '55000.50', 'Finance'),
(6, 'Alisha', 'alisha@example.com', ' 1122334455 ', NULL, 'MARKETING');

select * from dumy;

-- to handle null values
 select id,name,coalesce(phone,'no phones') as info from dumy;
 select id,coalesce(name,id) as name from dumy;
 
 -- to remove duplicates
 DELETE FROM dumy
WHERE id NOT IN (
  SELECT MIN(id)
  FROM dumy
  GROUP BY name, email, phone, salary, department
);

-- to remove whhitespaces
select id,trim(name) as clean_name,trim(phone) as clean_phone from dumy;

-- to replace emails
SELECT REPLACE(email, 'EXAMPLE', 'domain') AS replaced_email FROM dumy;
select replace(name, 'John','mari') as replaced_names from dumy;

-- case conversion
select upper(name) as up_name,lower(email) as lo_mail from dumy;

-- cast conversion(type)
select cast(salary as decimal(10,2)) as int_sal from dumy;

-- concating
select concat(id,'-',name) as concated_name from dumy;
-- DDL & DML Commands.sql
use HR_Management

-- new -- ااااا
--Rename phone_number to contact_number in employees table
	EXEC sp_rename 'employees.phone_number', 'contact_number', 'COLUMN';

-- new 
-- INNER JOIN -> Combines rows from multiple table based on a matching condition, returning only rows with matches in bpth table
-- SELECT first name, last name, department
	SELECT e.first_name, e.last_name,
	d.department_name
	FROM employees AS e 
	INNER JOIN departments AS d ON e.department_id = d.id;

-- Insert a new department, adding marketing 
	INSERT INTO departments (Department_name, Location_name, Email, Phone_number)
	VALUES ('Marketing', 'Saudi Arabia', 'Markitng@company.com', '123-456-7890');

-- to see
	SELECT *
	FROM departments;
-------

-- set employee status to Inactive
	UPDATE Employees
	SET employee_status = 'Inactive'
	WHERE id = 5;

-- Delete employee with id 10
	DELETE FROM employees
	WHERE id =10;



--- ااااااا
-- TRANSACTION 
--يعطيني التحكم الكامل في التعديلات قبل ينحفظ بشكل دائم واجيب العيد 
-- بس شوفي ماطبقته 
	BEGIN TRANSATION;

	UPDATE employee_status = 'Inactive'
	WHERE id = 5;

	DELETE FROM employeesWHERE id = 10;

	SELECT * FROM employees WHERE id IN (5,10); 
 -- ادا كان كل شي نفس الي ابي وبحفظه اكتب
	COMMIT;
--ادا مو نفس الي ابي وابي مااحفظ الي عدلت اكتب
	ROLLBACK;
--------------------

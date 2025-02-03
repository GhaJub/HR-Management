USE HR_Management;

--الفهارس تساعد في تسريع استعلامات البحث، خاصة عند التعامل مع كميات كبيرة من البيانات.
-- Indexing Queries

 /*hire_date في جدول employees
department_id وemployee_status
last_name
date_attendance وemployee_id في attendance
vacation_type في vacations
loan_status وloan_date في loans
payment_date في payroll*/
 --Improves query performance by speeding up data retrieval on specific columns
-- تحسين اداء الاستعلام عن طريق تسريع استرجاع البيانات على اعمده محددده
	-- to improve queries filtering by hire date
	CREATE INDEX idx_HireDate ON employees (hire_date);
	 --to speed up department/status queries
	CREATE INDEX idx_Department_Status ON employees (department_id, employee_status);
	--for faster searechs by last name
	CREATE INDEX idx_LastName ON employees (last_name);
	--to optimize attendance queries 
	CREATE INDEX idx_AttendanceDateAndEmployee ON attendance (date_attendance, employee_id);
	-- to speed up loan-related queries
	CREATE INDEX idx_LoanStatusAndDate ON loans (loan_status, loan_date);
	-- to improve payroll queries payment date
	CREATE INDEX idx_PaymentDate ON payroll (payment_date);
	-- for better vaction type queries 
	CREATE INDEX idx_VacationType ON vacations (vacation_type);
 -- اااااا
 -- u can see the index under the specific table that u use in index

SELECT hire_date -- test the index
FROM employees;

--Verify the index
SELECT vacation_type
FROM vacations;
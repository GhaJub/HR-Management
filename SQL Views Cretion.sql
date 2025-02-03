-- SQL views Creation 

USE HR_Management

CREATE VIEW vw_EmployeePayroll AS 
SELECT 
	 e.first_name,
    e.last_name,
    p.gross_salary,
    p.income_tax,
    p.net_salary,
    p.payment_date
FROM 
    employees e
INNER JOIN 
    payroll p ON e.id = p.employee_id;

-- Test the view
SELECT * FROM vw_EmployeePayroll;

-- View to sum bonuses by department
CREATE VIEW vw_BonusesByDepartment AS
SELECT 
    d.department_name,
    SUM(b.bouns_amount) AS total_bonuses
FROM 
    bouns b -- غلط السبيلنق عدلي اسم الجدول
INNER JOIN 
    employees e ON b.employee_id = e.id
INNER JOIN 
    departments d ON e.department_id = d.id
GROUP BY 
    d.department_name;

-- Test the view
SELECT * FROM vw_BonusesByDepartment;

-- View for attendance records
CREATE VIEW vw_EmployeeAttendance AS
SELECT 
    e.first_name,
    e.last_name,
    a.date_attendance,
    a.time_in,
    a.time_out,
    a.attendance_status
FROM 
    employees e
INNER JOIN 
    attendance a ON e.id = a.employee_id;

-- Test the view
SELECT * FROM vw_EmployeeAttendance;

-- View for vacation details by type
CREATE VIEW vw_VacationsByType AS
SELECT 
    e.first_name,
    e.last_name,
    v.vacation_type,
    v.start_date,
    v.end_date,
    v.vacation_status
FROM 
    employees e
INNER JOIN 
    vacations v ON e.id = v.employee_id;


-- Test the view
SELECT * FROM vw_VacationsByType
ORDER BY 
    vacation_type, vacation_status;


-- View for overtime details
CREATE VIEW vw_EmployeeOvertime AS
SELECT 
    e.first_name,
    e.last_name,
    o.date_overtime,
    o.hours_overtime,
    o.overtime_status
FROM 
    employees e
INNER JOIN 
    overtime o ON e.id = o.employee_id;

-- Test the view
SELECT * FROM vw_EmployeeOvertime;

--View to sum salary details by department
CREATE VIEW vw_SalaryByDepartment AS
SELECT 
    d.department_name,
    SUM(p.gross_salary) AS total_gross_salary,
    SUM(p.income_tax) AS total_income_tax,
    SUM(p.net_salary) AS total_net_salary
FROM 
    payroll p
INNER JOIN 
    employees e ON p.employee_id = e.id
INNER JOIN 
    departments d ON e.department_id = d.id
GROUP BY 
    d.department_name;

-- Test the view
SELECT * FROM vw_SalaryByDepartment;

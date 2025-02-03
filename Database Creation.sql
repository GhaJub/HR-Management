-- Create the Database
CREATE DATABASE HR_Management;

USE HR_Management;

-- Table for departments
--كل موظف ينتمي الى قسم معين, لدلك احتجنا الى تخزين بيانات الاقسام 
CREATE TABLE departments(
	Id INT PRIMARY KEY IDENTITY(1,1), --Auto-incremeting --يعني العمود يبدا  من 1 ويزيد بمقدار 1 لكل سجل جديد
	Department_name NVARCHAR (100) NOT NULL, 
	Location_name NVARCHAR(100),
	Email NVARCHAR (100) UNIQUE,
	Phone_number NVARCHAR(20)
);

-- Table for job position 
-- يحدد هدا الجدول الوظائف المختلفه داخل الشركة 
--ليش نحتاجه؟ لان كل موظف له وظيفه محدده وهدا الجدول يحدد اسماء الوظايق وتفاصيلها
CREATE TABLE positions(
	Id INT PRIMARY KEY IDENTITY(1,1),   
	Position_name NVARCHAR(100) NOT NULL,
	Position_description TEXT -- new 
);

--عشان اشوف
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dbo.positions';



-- الجدول الاساسي الي يخزن بيانات الموظفين ويحدد القسم والوظيفه لكل موظف
--Table for Employee info
CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY(1,1), --new
	first_name NVARCHAR(100) NOT NULL,
	last_name NVARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,-- new
	Email NVARCHAR (50), 
	Phone_number NVARCHAR (15) NOT NULL,
	Position_id INT NOT NULL, --هي كاتبه Foreign key
	hire_date DATE NOT NULL,
	department_id INT NOT NULL, --هي كاتبه Foreign key to departments table
	employee_status NVARCHAR(50) NOT NULL DEFAULT 'Active' , ---> هي ماسوتها --يتم ضبط الحاله تلقائيا على اكتيف عند ادخال الموظف لاول مره  
	FOREIGN KEY (position_id) REFERENCES dbo.positions(id),   --Links to positions.id
	FOREIGN KEY (department_id) REFERENCES dbo.departments(id) -- Links to departments.id
);
-- to see
SELECT*
FROM employees;

--Track Attendance 
CREATE TABLE attendance (
	id INT PRIMARY KEY IDENTITY(1,1),
	date_attendance DATE NOT NULL,
	time_in TIME,
	time_out TIME,
	employee_id INT NOT NULL, -- Foreign key to employees table
	attendance_status NVARCHAR(50) DEFAULT 'Present', -- new  بس هي ماسوته 
	FOREIGN KEY (employee_id) REFERENCES employees(id) -- Linked employees.id
);

-- لاداره الرواتب وحساب الضرائب والرواتب الصافيه لكل موظف
-- Table for payroll -- رواتب الموظفين
CREATE TABLE payroll(
	id INT PRIMARY KEY IDENTITY(1,1),
	gross_salary DECIMAL(18,2), -- 16 قبل الفاصله وثنين بعد الفاصله(الراتب الاجمالي)ز
	income_tax DECIMAL(18,2),--ضريبه الدخل)
	net_salary DECIMAL(18,2),-- (الراتب الصافي)
	payment_date DATE,
	employee_id INT NOT NULL, -- Foreign key to employees table
	payroll_status NVARCHAR (50),
	FOREIGN KEY (employee_id) REFERENCES employees(id) -- Linled to employees.id
);

--Table for  info employees vacations
CREATE TABLE vacations (
	id INT PRIMARY KEY IDENTITY(1,1),
	vacation_type NVARCHAR(100),
	start_date DATE,
	end_date DATE,
	employee_id INT NOT NULL, -- Forgein key to employees table
	vacation_status NVARCHAR(50),
	FOREIGN KEY (employee_id) REFERENCES employees(id) -- Linked to employees.id
);

--لادارة القروض الماليه التي ياخدونها الموظفين من الشركه
--Table for Loans given to employees
CREATE TABLE loans(
	id INT PRIMARY KEY IDENTITY(1,1),
	loan_amount DECIMAL(18,2),
	loan_date DATE,
	loan_start DATE,
	loan_end DATE,
	employee_id INT NOT NULL, --Goreign ket to emploees table
	loan_status VARCHAR(50) DEFAULT 'Pending',
	FOREIGN KEY (employee_id) REFERENCES employees(id), -- Linked to employees.id
	         -- new
	CHECK (loan_start <= loan_end) -- ensure start date is before the end date
);

-- Table for Overtime Records
CREATE TABLE overtime(
	id INT PRIMARY KEY IDENTITY(1,1),
	date_overtime DATE NOT NULL,
	hours_overtime DECIMAL(5,2),
	employee_id INT NOT NULL, -- Foreign key to employees table
	overtime_status VARCHAR(50),
	FOREIGN KEY (employee_id) REFERENCES employees(id) -- Linked to employees.id
);

-- Table for Bounses awarded to employees
CREATE TABLE bouns(
	id INT PRIMARY KEY IDENTITY(1,1),
	bouns_amount DECIMAL(18,2),
	bouns_date DATE,
	employee_id INT NOT NULL, -- Foreign key to employees table
	bonus_status NVARCHAR(50),
	FOREIGN KEY (employee_id) REFERENCES employees(id) --Linked to employees.id
);



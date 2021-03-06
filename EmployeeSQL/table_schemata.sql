-- We have to Drop each table in case we previously had tables with the same name
DROP TABLE Departments CASCADE;
DROP TABLE Dept_emp CASCADE;
DROP TABLE Dept_manager CASCADE;
DROP TABLE Employees CASCADE;
DROP TABLE Salaries CASCADE;
DROP TABLE Titles CASCADE;

-- We have to create first the tables that contain the primary keys and then the tables that contain the 
-- foreign keys so we don't have trouble.

-- Create table Titles
CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL, 
	PRIMARY KEY (title_id)
);

-- Create table Employees
CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- Change the datestyle 
SET DATESTYLE='SQL,MDY'
ALTER DATABASE "sql-challenge" SET datestyle TO "SQL, MDY"

SELECT * FROM employees;

-- Create table Departments
CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

-- Create table Dept_emp
CREATE TABLE Dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Create table Dept_manager
CREATE TABLE Dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create table Salaries
CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,	
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)

);

-- After importing the data verify that the process was successfully completed, the data must 
-- be imported in the same order as the tables were created.
SELECT * FROM Titles;
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Dept_emp;
SELECT * FROM Dept_manager;
SELECT * FROM Salaries;

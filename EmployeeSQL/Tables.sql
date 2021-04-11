DROP TABLE departments CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;

--Create table for titles with title_id as primary key
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL PRIMARY KEY,
    "title" VARCHAR   NOT NULL
);
--View table
select * from titles;

--Create table for employees with emp_no as primary key
CREATE TABLE "employees" (
    "emp_no" VARCHAR   NOT NULL PRIMARY KEY,
    "emp_title_id" VARCHAR   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    "birth_date" DATE,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE);

--View table
select * from employees;

--Create table for salaries with emp_no as primary key
CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "salary" INTEGER   NOT NULL
);
--View table
select * from salaries;

--Create table for departments with dept_no as primary key
CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL PRIMARY KEY,
	"dept_name" VARCHAR   NOT NULL
	);

--View table
select * from departments;


--Create table for departments' manager with emp_no as primary key
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" VARCHAR   NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);
--View table
select * from dept_manager;


--Create table for employees and departments with emp_no and dept_no as composite primary key
CREATE TABLE "dept_emp" (
	"emp_no" VARCHAR   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
	PRIMARY KEY(emp_no,dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	
);

--View table
select * from dept_emp;


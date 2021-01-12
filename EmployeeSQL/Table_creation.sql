--Create Table for Employees
DROP TABLE employees;

CREATE TABLE employees(

emp_no INT,
emp_title_id VARCHAR,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date DATE,
PRIMARY KEY (emp_no));

select * from employees;

-- Create table for departments

DROP TABLE departments;

CREATE TABLE departments (
dept_no VARCHAR,
dept_name VARCHAR,
PRIMARY KEY (dept_no));

SELECT * FROM departments;

-- Create table for dept_emp

DROP TABLE dept_emp;

CREATE TABLE dept_emp (
emp_no INT,
dept_no VARCHAR,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

SELECT * FROM dept_emp;

-- Create table for managers
DROP TABLE dept_managers;

CREATE TABLE dept_managers (
dept_no VARCHAR,
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

SELECT * FROM dept_managers;

--Create table for the salaries
DROP TABLE salaries;

CREATE TABLE salaries (
emp_no INT,
salary INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

SELECT * FROM salaries;

--Create table for titles
DROP TABLE titles;

CREATE TABLE titles (
title_id VARCHAR,
title VARCHAR,
PRIMARY KEY (title_id));

SELECT * FROM titles;

ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
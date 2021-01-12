--1. List of employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--2.  List first name, last name, and hire date for employees who were hired in 1986
SELECT employees.first_name,
employees.last_name,
employees.hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = 1986;

--3. List manager of each departments info department number, department name, the manager's employee number, last name, first name.
SELECT dept_managers.dept_no, 
departments.dept_name,
dept_managers.emp_no,
employees.last_name, 
employees.first_name
FROM dept_managers
LEFT JOIN departments
ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_managers.emp_no = employees.emp_no;

--4.List dept of each employee info, employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
SELECT employees.first_name,
employees.last_name,
employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6.List all employees in Sales department includig their employee nuber, last name, first name, and department name.
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';


--7.List all employees in the sales and dev departments includig their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development');

--8. In descending order list the frequency count of employee last names ie. how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;

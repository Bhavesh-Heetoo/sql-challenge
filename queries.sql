SELECT * FROM titles

-- 1.List the employee number, last name, first name, sex, and salary of each employee

-- selecting the required collums
SELECT employees.emp_no , employees.last_name , employees.first_name , employees.sex, salary.salary
FROM employees
JOIN salary ON employees.emp_no = salary.emp_no;

-- 2.List the first name, last name, and hire date for the employees who were hired in 1986
-- selecting the required collums
SELECT first_name , last_name , hire_date
FROM employees
-- filtering for employees who were hired in 1986
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

-- selecting the required collums
SELECT deparments.dept_no , deparments.dept_name , employees.emp_no, employees.first_name , employees.last_name 
FROM deparments
-- Joing based on dept# and emp # for deparment managers
JOIN dept_manager ON deparments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name

-- Selecting the required collums
SELECT deparments_emp.dept_no , employees.emp_no , employees.last_name , employees.first_name ,deparments.dept_name
FROM deparments_emp 
-- Joining to link deparment number to employee and deparment name 
JOIN employees ON deparments_emp.emp_no = employees.emp_no
JOIN deparments ON deparments_emp.dept_no = deparments.dept_no;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

-- selecting required collums
SELECT first_name , last_name , sex
FROM employees
-- filtering for first name of Hercules and last name that starts with B
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6.List each employee in the Sales department, including their employee number, last name, and first name (2 points)
-- listing out deparment names
SELECT * FROM deparments

--selecting required collums
SELECT employees.emp_no , employees.last_name, employees.first_name 
FROM employees
-- Joining based on employee number and deparemtn number
JOIN deparments_emp ON employees.emp_no = deparments_emp.emp_no
JOIN deparments ON deparments_emp.dept_no = deparments.dept_no 
-- filtering for sales deparment
WHERE deparments.dept_name = 'Sales';

-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

-- selecting required collums
SELECT employees.emp_no , employees.last_name, employees.first_name , deparments.dept_name
FROM employees
-- Joining based on employee number and deparemtn number
JOIN deparments_emp ON employees.emp_no = deparments_emp.emp_no
JOIN deparments ON deparments_emp.dept_no = deparments.dept_no 
WHERE deparments.dept_name = 'Sales' OR deparments.dept_name = 'Development';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

-- selecting required collums and counting
SELECT last_name , Count(*) AS name_count
FROM employees
-- grouping by last name
GROUP BY last_name
-- ording by descending order
ORDER BY name_count DESC;
		

-- Creating titles table
CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);


-- Creating deparment table
CREATE TABLE deparments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL UNIQUE
);

-- Creating employee table 
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(10),
	birth_date DATE NOT NULL , 
	first_name VARCHAR(50) NOT NULL ,
	last_name VARCHAR(50) NOT NULL ,
	sex CHAR(1),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Creating salary table
CREATE TABLE salary(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Creating dept_emp table
CREATE TABLE deparments_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	-- Setting a composite key for for employees with more then 1 deparment
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES deparments(dept_no)
);

-- Creating dept_manager table 
CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	-- Setting a composite key for deparments that have more then 1 manager 
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES deparments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

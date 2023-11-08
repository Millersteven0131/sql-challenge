DROP TABLE IF exists employees;
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (10), 
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex CHAR(1),
	hire_date DATE
);
--SELECT * FROM employees;

CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(30)
);
--SELECT * FROM departments;

DROP TABLE IF exists dept_emp;
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
--SELECT * FROM dept_emp;

DROP TABLE IF exists dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
--SELECT * FROM dept_manager;

DROP TABLE IF exists salaries;
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
--SELECT * FROM salaries;
	
DROP TABLE IF exists titles;
CREATE TABLE titles(
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR NOT NULL
);
--SELECT * FROM titles;


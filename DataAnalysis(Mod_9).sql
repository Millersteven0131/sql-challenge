--List the employee number, last name, first name, sex, and salary of each employee.
SELECT E.emp_no,
		E.last_name,
		E.first_name,
		E.sex,
		S.salary
FROM employees AS E
INNER JOIN salaries AS S ON E.emp_no = S.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
		last_name,
		hire_date
FROM employees AS E
Where hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no,
		d.dept_name,
		dm.emp_no,
		e.last_name,
		e.first_name
	FROM dept_manager AS dm 
	INNER JOIN departments AS d ON (dm.dept_no=d.dept_no)
	INNER JOIN employees AS e ON (e.emp_no=dm.emp_no);
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no,
		d.dept_name,
		e.emp_no,
		e.last_name,
		e.first_name
	FROM dept_emp AS de
	INNER JOIN departments AS d ON (d.dept_no=de.dept_no)
	INNER JOIN employees AS e ON (e.emp_no=de.emp_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name,
		e.last_name,
		e.sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.first_name,
		e.last_name,
		e.emp_no,
		d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON (de.emp_no = e.emp_no)
INNER JOIN departments AS d ON (d.dept_no = de.dept_no)
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.first_name,
		e.last_name,
		e.emp_no,
		d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON (de.emp_no = e.emp_no)
INNER JOIN departments AS d ON (d.dept_no = de.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT (last_name) AS last_name_count
	FROM employees
	GROUP BY last_name
	ORDER BY COUNT (last_name) DESC;
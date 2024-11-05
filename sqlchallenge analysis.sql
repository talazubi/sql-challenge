--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT
e.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name",
e.sex as "sex", 
s.salary as "salary"
FROM 
employees as e JOIN salaries as s
ON e.emp_no = s.emp_no;


--2. List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT 
first_name as "first name",
last_name as "last name",
hire_date as "hire date"
FROM employees 
WHERE hire_date like '%1986';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT
dm.dept_no as "department number",
d.dept_name as "department name",
dm.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name"
FROM dept_manager as dm 
JOIN departments as d
ON dm.dept_no = d.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no; 

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
d.dept_no as "department number",
e.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name",
d.dept_name as "department name"
FROM dept_emp as de JOIN departments as d 
ON de.dept_no = d.dept_no 
JOIN employees as e 
ON de.emp_no = e.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
first_name as "first name", 
last_name as "last name",
sex as "sex"
FROM employees 
WHERE first_name = 'Hercules' and last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name 
SELECT
e.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name",
d.dept_name as "department name"
FROM employees as e JOIN dept_emp as de 
ON e.emp_no = de.emp_no 
JOIN departments as d ON de.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
e.emp_no as "employee number",
e.last_name as "last name",
e.first_name as "first name",
d.dept_name as "department name"
FROM employees as e JOIN dept_emp as de 
ON e.emp_no = de.emp_no 
JOIN departments as d ON de.dept_no = d.dept_no 
WHERE d.dept_name IN ('Sales', 'Development');
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT 
last_name, count (last_name) as "frequency counts"
FROM employees
GROUP BY last_name 
ORDER BY "frequency counts" desc;
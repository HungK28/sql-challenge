  
--1. List the following details of each employee: employee number, last name, 
--first name, gender, and salary.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex, 
	s.salary
from employees e 
	join salaries s on e.emp_no = s.emp_no

--2.List employees who were hired in 1986.
select 
	e.first_name, 
	e.last_name, 
	e.hire_date
from employees e 
where e.hire_date BETWEEN '1986-01-01' and '1968-12-31'

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
join departments d on d.dept_no = dm.dept_no
join employees e on e.emp_no = dm.emp_no;

--4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e 
join dept_emp de on de.dept_no = e.emp_no 
order by 1;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex from employees e 
where first_name = 'Hercules'
and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e 
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

--7. List all employees in the Sales and Development 
--departments, including their employee number, last name, 
--first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees e 
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

--8. In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Total Name Count"
from employees
group by last_name
order by 2 desc;

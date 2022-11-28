--1. List the following details of each employee:
--employee number, last name, first name, sex, and salary.
select e.emp_no as "Employee Number", e.last_name as "Last Name",
e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
from employees as e
inner join salaries as s on 
s.emp_no = e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
from employees
where hire_date like '%1986';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select m.dept_no as "Department Number", d.dept_name as "Department Name",
m.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
from department_managers m
left join departments d
on m.dept_no = d.dept_no
left join employees e
on e.emp_no = m.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select z.demp_no as "Employee Number", e.last_name as "Last Name",
e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
left join department_employees z
on e.emp_no = z.demp_no
left join departments d
on d.dept_no = z.dept_no;

--5. List first name, last name, and sex for employees whose
--first name is "Hercules" and last names begin with "B."
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules' and last_name like 'B%';


--6. List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
select z.demp_no as "Employee Number", e.last_name as "Last Name",
e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
left join department_employees z
on e.emp_no = z.demp_no
left join departments d
on d.dept_no = z.dept_no
where d.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select z.demp_no as "Employee Number", e.last_name as "Last Name",
e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
left join department_employees z
on e.emp_no = z.demp_no
left join departments d
on d.dept_no = z.dept_no
where d.dept_name = 'Development' or d.dept_name = 'Sales';

--8. List the frequency count of employee last names 
--(i.e., how many employees share each last name) in descending order.
select last_name, count(last_name) as "Count of Last Name"
from employees
group by last_name
order by "Count of Last Name" desc;
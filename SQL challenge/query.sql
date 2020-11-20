-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no,e.first_name,e.last_name,e.sex,s.salary from employees as e
join salaries as s on 
s.emp_no = e.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name,last_name,hire_date from employees where hire_date between '1986-01-01' and '1986-12-31'

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

select d.dept_no,d.dept_name,e.emp_no as "manager emp_no",
e.first_name as "manager first_name",e.last_name as "manager last_name" from employees e
join dept_manager as dm on
dm.emp_no = e.emp_no
join departments as d on
d.dept_no = dm.dept_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_no, d.dept_name from employees as e
join dept_emp as de on
de.emp_no = e.emp_no
join departments as d on
d.dept_no = de.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,last_name,sex from employees where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.first_name,e.last_name,dp.dept_name from employees as e 
join dept_emp as de on 
de.emp_no = e.emp_no
join departments as dp on
dp.dept_no=de.dept_no
where dp.dept_name='Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--1st Approach

select e.emp_no, e.first_name,e.last_name,dp.dept_name from employees as e 
join dept_emp as de on 
de.emp_no = e.emp_no
join departments as dp on
dp.dept_no=de.dept_no
where dp.dept_name in ('Sales','Development') 


--2nd Approach
select e.emp_no, e.first_name,e.last_name,dp.dept_name from employees as e 
join dept_emp as de on 
de.emp_no = e.emp_no
join departments as dp on
dp.dept_no=de.dept_no
where dp.dept_name='Sales' 

union

select e.emp_no, e.first_name,e.last_name,dp.dept_name from employees as e 
join dept_emp as de on 
de.emp_no = e.emp_no
join departments as dp on
dp.dept_no=de.dept_no
where dp.dept_name='Development' 

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as "Total Count" from employees 
group by last_name 
order by "Total Count" desc

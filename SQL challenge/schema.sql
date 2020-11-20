-- create departments table
drop table if exists departments;
create table departments(
	dept_no varchar(64) PRIMARY KEY,
	dept_name VARCHAR(64)
);
select * from departments;

-- create titles table
drop table if exists titles;
create table titles(
	title_id varchar(64) NOT NULL primary key,
	title varchar(64) NOT NULL
);
select * from titles;

--create employees table
drop table if exists employees;
create table employees(
	emp_no int not null PRIMARY KEY,
	emp_title_id varchar(64) not null, 
	birth_date varchar(64) not null,
	first_name varchar(255) not null, 
	last_name varchar(64) not null, 
	sex char not null,
	hire_date varchar(64) not null,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
select * from employees;

--create dept_manager table
drop table if exists dept_manager;
create table dept_manager(
	dept_no varchar(64) NOT NULL,
	Foreign Key (dept_no) references departments(dept_no),
	emp_no int NOT NULL, --not declared as PK assuming one emp may control more than one dept
	Foreign Key (emp_no) references employees(emp_no)
);
select * from dept_manager;

--create dept_emp table
drop table if exists dept_emp;
create table dept_emp(
	emp_no int not null, -- not declared as PK since multiple emp_no exists in more than one dept
	Foreign Key (emp_no) references employees(emp_no),
	dept_no varchar(64) not null,
	Foreign Key (dept_no) references departments(dept_no)
);
select * from dept_emp;

--to prove the theory that one emp can exists in multiple dept
select emp_no,count(*) from dept_emp group by emp_no having count(*) > 1;
select * from dept_emp where emp_no=39224

--create salaries table
drop table if exists salaries;
create table salaries(
	emp_no int not null PRIMARY KEY,-- declared as PK to make sure not giving salary more than once to same emp_no
	salary int not null,
	Foreign Key (emp_no) references employees(emp_no)
);
select * from salaries
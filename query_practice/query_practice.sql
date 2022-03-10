-- 1) A query that will return the total number of employees.

select count(emp_no) as employee_numbers
from employees; #Output 300024

-- 2) A query that will return the total number of departments.

select count(dept_no) as departments_numbers
from departments;  # Output 9

-- 3) A query that will return the total number of employees within each department.

select count(emp_no) as Customer_Service from dept_emp
where dept_no = "d009"; #Output 23580

select count(emp_no) as Development from dept_emp
where dept_no = "d005"; #Output 85707

select count(emp_no) as Finance from dept_emp
where dept_no = "d002"; #Output 17346

select count(emp_no) as HR from dept_emp
where dept_no = "d003"; #Output 17786

select count(emp_no) as Marketing from dept_emp
where dept_no = "d001"; #Output 20211

select count(emp_no) as Production from dept_emp
where dept_no = "d004"; #Output 73485

select count(emp_no) as Quality_Management from dept_emp
where dept_no = "d006"; #Output 20117

select count(emp_no) as Research from dept_emp
where dept_no = "d008"; #Output 21126

select count(emp_no) as Sales from dept_emp
where dept_no = "d007"; #Output 52245


-- 4) A query that will return the 5 employees who worked at the company the longest.

select * from employees e
order by  e.hire_date asc
limit 5; #Output for emp_no are 110022, 110511, 110303, 110085, 110183


-- 5) A query that will return the 10 newest employees.

select * from employees order by hire_date desc
limit 10; #Output of emp_no are 463807, 428377, 499553, 222965, 47291, 422990, 227544, 205048, 226633, 424445


-- 6) A query that will return the first name, last name, and salary of the top 10 highest paid employees.

select distinct e.emp_no, e.first_name, e.last_name, s.salary
from salaries s
join employees e
on s.emp_no = e.emp_no
order by s.salary desc
limit 10; # Output Tokuyasu 158220, Tokuyasu 157821, Honesty 156286, Xiahua 155709, Sanjai 155513, Tsutomu 155377, Tsutomu 155190, Tsutomu 154888, Tsutomu 154885, Willard 154459


-- 7) A query that will return the first name, last name, and salary of the highest paid manager.

select employees.emp_no, employees.first_name, employees.last_name, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no
join dept_manager
on salaries.emp_no = dept_manager.emp_no
order by salaries.salary desc
limit 1; # output is Margareta Markovitch 108407


-- 8) A query that will return the first name, last name, and salary of the lowest paid manager.

select employees.emp_no, first_name, employees.last_name, salaries.salary 
from employees
join salaries
on salaries.emp_no = employees.emp_no
join dept_manager
on dept_manager.emp_no = salaries.emp_no
order by salaries.salary asc
limit 1; # output is Karsten Sigstam 40000

-- 9) A query that will return the number of employees with each title (ie, Software Engineer).

select titles.title, count(titles.emp_no) as employee_count
from titles
join employees
on employees.emp_no = titles.emp_no
group by titles.title
order by employee_count desc; #output is (Engineer 115003, Staff 107391, Senior Engineer 97750, Senior Staff 92853, Technique Leader 15159, Assistant Engineer 15128, Manager 24)


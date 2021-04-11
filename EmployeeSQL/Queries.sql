--List the following details of each employee: employee number, last name, first name, sex, and salary

Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s
on (e.emp_no = s.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

Select d.dept_no, ds.dept_name, d.emp_no, e.last_name, e.first_name, e.emp_title_id
from dept_manager as d
join departments as ds
on (d.dept_no = ds.dept_no)
join employees as e
on (d.emp_no = e.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
Select d.emp_no, e.last_name, e.first_name, ds.dept_name
from dept_emp as d
join departments as ds
on (d.dept_no = ds.dept_no)
join employees as e
on (d.emp_no = e.emp_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select d.emp_no, e.last_name, e.first_name, ds.dept_name
from dept_emp as d
join departments as ds
on (d.dept_no = ds.dept_no)
join employees as e
on (d.emp_no = e.emp_no)
where ds.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select d.emp_no, e.last_name, e.first_name, ds.dept_name
from dept_emp as d
join departments as ds
on (d.dept_no = ds.dept_no)
join employees as e
on (d.emp_no = e.emp_no)
where ds.dept_name = 'Sales'
OR ds.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as count_of_last_name
from employees
group by last_name
order by last_name DESC


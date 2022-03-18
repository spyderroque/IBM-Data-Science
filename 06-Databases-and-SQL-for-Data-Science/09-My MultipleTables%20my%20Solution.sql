-- Exercise 1: Accessing Multiple Tables with Sub-Queries
-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees 
	where job_id in (select Job_ident from jobs);
	
-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * from employees
	where job_id in (select job_ident from jobs where job_title = 'Jr. Designer');

-- Retrieve JOB information and list of employees who earn more than $70,000.
select * from jobs
	where job_ident in (select job_id from employees where salary > 70000);
	-- Soluton from IBM (results are identical):
	select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );	

-- Retrieve JOB information and list of employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs 
	where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE) > '1976' );


-- Retrieve JOB information and list of female employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs
	where job_ident in (select Job_id from employees
	where sex = 'F' and year(b_date) > 1976);

-- Exercise 2: Accessing Multiple Tables with Implicit Joins
-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees, jobs;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees E, jobs J
	where e.job_id = j.job_ident; -- This version was meant without the aliases E & J

-- Redo the previous query, using shorter aliases for table names.
select * from employees E, jobs J
	where e.job_id = j.job_ident;

-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select Emp_id, L_name, f_name, job_title from employees E, jobs J
	where e.job_id = j.job_ident;

-- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
select E.Emp_id, E.L_name, E.f_name, J.job_title from employees E, jobs J
	where e.job_id = j.job_ident;

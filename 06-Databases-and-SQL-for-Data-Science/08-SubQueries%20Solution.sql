-- Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
Select EMP_ID, L_name, F_name, Salary from EMPLOYEES
	where Salary < avg(salary);

-- Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
Select EMP_ID, L_name, F_name, Salary from EMPLOYEES
	where Salary < (Select avg(Salary) from employees);

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
Select EMP_ID, Salary, max(salary) as MAX_SALARY from EMPLOYEES;

-- Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
Select EMP_ID, Salary, (select max(salary) as MAX_SALARY from Employees) from EMPLOYEES;

-- Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
SELECT * from (select EMP_ID, L_Name, F_Name, Job_ID, Manager_ID, Dep_id from employees);
-- from the solution:
SELECT * from (select EMP_ID, L_Name, F_Name, Job_ID, Manager_ID, Dep_id from employees) as Emp4All;
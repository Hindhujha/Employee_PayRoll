create database payroll_service

use payroll_service

create table employee_payroll(
Employee_ID int identity(1,1),--id is auto increment by 1
Employee_Name varchar(255),
Employee_Salary int,
StartDate Date,

)
--employee details inserted into table
INSERT INTO employee_payroll values('RAM',25000,'2021-01-02')
INSERT INTO employee_payroll values('RAVI',23000,'2021-05-06')
INSERT INTO employee_payroll values('ANU',22000,'2021-07-08')
INSERT INTO employee_payroll values('ANNIE',24000,'2021-07-05')
--retrieve employee details from table
select * from employee_payroll

--retrieve particular employee detail from table
select Employee_Salary from employee_payroll where Employee_Name='ANNIE' 

--retrieve  employee detail from start dates
select Employee_Name from employee_payroll where StartDate BETWEEN CAST('2021-05-06' AS DATE) AND  CAST('2021-07-08' AS DATE) ;


--Altered table by adding a new coloumn gender
Alter Table employee_payroll 
Add Gender char(1)

---set the value for gender
update employee_payroll set Gender='F'

----update gender for ram and ravi
update employee_payroll set Gender='M' where Employee_Name='RAM' 
update employee_payroll set Gender='M' where Employee_Name='RAVI' 
select * from employee_payroll

----inserting multiple persons
INSERT INTO employee_payroll values('CHRIS',20000,'2021-01-07','M')
INSERT INTO employee_payroll values('ANITA',26000,'2021-05-09','F')
INSERT INTO employee_payroll values('PRIYA',22000,'2021-07-01','F')
INSERT INTO employee_payroll values('KRIS',29000,'2021-08-10','M')
INSERT INTO employee_payroll values('KEVIN',28000,'2021-08-20','M')

------using functions 
select count(Employee_Name) from employee_payroll ----no.of.employees
select count(Employee_Name) from employee_payroll where Gender='F' GROUP BY Gender ---shows no.of female employees
select count(Employee_Name) from employee_payroll where Gender='M' GROUP BY Gender ---shows no.of male employees

select sum(Employee_Salary) from employee_payroll where  Gender='F' GROUP BY Gender ---shows sum of female employees salary
select sum(Employee_Salary) from employee_payroll where  Gender='M' GROUP BY Gender ---shows sum of male employees salary

select avg(Employee_Salary) from employee_payroll where  Gender='F' GROUP BY Gender ---shows average of female employees salary
select avg(Employee_Salary) from employee_payroll where  Gender='M' GROUP BY Gender---shows average of female employees salary

select min(Employee_Salary) from employee_payroll -- shows minimum salary of employees

select max(Employee_Salary) from employee_payroll  -- shows minimum salary of employees

----extend the payroll employee table
Alter Table employee_payroll
add Phone_Number varchar(50),
Employee_Address varchar(100),
Department varchar(100)

select * from employee_payroll

update employee_payroll set Phone_Number='9123456789', Department='Sales' where Employee_Name='RAM' 
update employee_payroll set Phone_Number='9893456789' , Department='Marketing' where Employee_Name='RAVI' 
update employee_payroll set Phone_Number='9893456222' , Department='Design' where Employee_Name='ANU' 
update employee_payroll set Phone_Number='9893459876' , Department='Design' where Employee_Name='ANNIE' 
update employee_payroll set Phone_Number='9891458922' , Department='Sales' where Employee_Name='CHRIS' 
update employee_payroll set Phone_Number='9893432120' , Department='Marketing' where Employee_Name='ANITA' 
update employee_payroll set Phone_Number='9765156222' , Department='Finance' where Employee_Name='PRIYA' 
update employee_payroll set Phone_Number='9893456880' , Department='Finance' where Employee_Name='KRIS' 
update employee_payroll set Phone_Number='9892389012' , Department='Marketing' where Employee_Name='KEVIN' 

update employee_payroll set Employee_Address='Chennai'--default value
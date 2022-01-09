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

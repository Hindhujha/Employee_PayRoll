create database payroll_service

use payroll_service

create table employee_payroll(
Employee_ID int identity(1,1),
Employee_Name varchar(255),
Employee_Salary int,
StartDate Date,
)



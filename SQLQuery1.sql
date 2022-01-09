create database payroll_service

use payroll_service

create table employee_payroll(
Employee_ID int identity(1,1) ,--id is auto increment by 1
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

---payroll table extends
Alter Table employee_payroll 
add BasicPay float,
Deductions float,
Taxable_pay float,
Tax float,
NetPay float


update employee_payroll set BasicPAY=20000, Deductions=1000,Taxable_Pay=2000,Tax=300,NetPay=19000 where Employee_ID=2 
update employee_payroll set BasicPAY=18000, Deductions=2000,Taxable_Pay=1500,Tax=400,NetPay=17000 where Employee_ID=3 
update employee_payroll set BasicPAY=22000, Deductions=1000,Taxable_Pay=1200,Tax=200,NetPay=21000 where Employee_ID=4 
update employee_payroll set BasicPAY=18000, Deductions=1000,Taxable_Pay=1300,Tax=300,NetPay=17000 where Employee_ID=5 
update employee_payroll set BasicPAY=22000, Deductions=2000,Taxable_Pay=1400,Tax=100,NetPay=21000 where Employee_ID=6 
update employee_payroll set BasicPAY=19000, Deductions=1000,Taxable_Pay=1100,Tax=300,NetPay=18000 where Employee_ID=7 
update employee_payroll set BasicPAY=25000, Deductions=1000,Taxable_Pay=1700,Tax=200,NetPay=24000 where Employee_ID=8 
update employee_payroll set BasicPAY=26000, Deductions=2000,Taxable_Pay=1600,Tax=400,NetPay=24000 where Employee_ID=9 

select * from employee_payroll

update employee_payroll set Employee_Name='TERISSA' where Employee_ID=6

select * from employee_payroll where Employee_Name='TERISSA'--shows all details of teriss

use payroll_service

ALTER table employee_payroll
Add PRIMARY KEY (Employee_ID)----primary key is added for employee_payroll

-----------------------------------------create new table

create table employee_department
(
Department_ID int identity(1000,1),
Employee_Id int foreign key references employee_payroll(Employee_ID)
)

select * from employee_department

INSERT INTO employee_department values(1)
INSERT INTO employee_department values(2)
INSERT INTO employee_department values(3)
INSERT INTO employee_department values(4)
INSERT INTO employee_department values(5)
INSERT INTO employee_department values(6)
INSERT INTO employee_department values(7)
INSERT INTO employee_department values(8)
INSERT INTO employee_department values(9)

------using functions 
select sum(Employee_Salary) from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID where Gender='F' GROUP BY Gender

select sum(Employee_Salary) from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID where Gender='M' GROUP BY Gender


select avg(Employee_Salary) from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID where Gender='M' GROUP BY Gender

select avg(Employee_Salary) from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID where Gender='F' GROUP BY Gender



select min(Employee_Salary) from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID  -- shows minimum salary of employees

select max(Employee_Salary) from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID  -- shows minimum salary of employees


select * from employee_department

select employee_payroll.Employee_Name from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID

select Employee_Salary from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID


select StartDate from employee_payroll inner join employee_department
on employee_department.Employee_Id=employee_payroll.Employee_ID where StartDate BETWEEN CAST('2021-05-06' AS DATE) AND  CAST('2021-07-08' AS DATE) ;
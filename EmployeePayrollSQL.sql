


/*UC1 UC2 DataBase Created and Employee_Payroll Created*/
create database Employee_Payroll;
use Employee_Payroll;
CREATE TABLE Employee_Payroll
(
id int NOT NULL IDENTITY(1,1),
Name varchar(100),
Salery decimal,
StartDate Date,
Primary KEY(id)
);

/*UC3-Insert into Table*/

INSERT INTO Employee_Payroll (Name,Salery,StartDate) values('Amit',40000,'2022-02-22'),('Amol',40000,'2022-02-13');
INSERT INTO Employee_Payroll  values('nikhil',35000,'2022-01-05'),('shraddha',35000,'2022-04-6'),('ranjeet',35000,'2022-02-24');


/*UC4- Retrive Data from table*/

SELECT * FROM Employee_Payroll;
SELECT Name FROM Employee_Payroll;

/*UC5- Retrive data of Particular Employee*/

SELECT Salery FROM Employee_Payroll WHERE NAME='Amit';
select * from Employee_Payroll WHERE StartDate BETWEEN CAST('2022-01-10' AS DATE) AND CAST('2022-04-01' AS DATE);


/*UC6- Ability To Add Gender*/

Alter table Employee_Payroll add gender varchar(2);
UPDATE Employee_Payroll SET gender='M' where Name='Amit';
UPDATE Employee_Payroll SET gender='F' where Name='shraddha' ;

/*UC7- Ability to find min, max, average,count*/

Select sum(Salery) from Employee_Payroll where Gender='F'; 
Select avg(Salery) from Employee_Payroll where Gender='F';
Select min(Salery) from Employee_Payroll where Gender='F'; 
Select max(Salery) from Employee_Payroll where Gender='F'; 
Select count(id) from Employee_Payroll where Gender='F'; 

Select sum(Salery) from Employee_Payroll where Gender='M'; 
Select min(Salery) from Employee_Payroll where Gender='M'; 
Select max(Salery) from Employee_Payroll where Gender='M'; 
Select avg(Salery) from Employee_Payroll where Gender='M';
Select count(id) from Employee_Payroll where Gender='M'; 

/*UC8- Added phonenumber, address,department*/
 
Alter table Employee_Payroll drop column PhoneNumber; 
Alter table Employee_Payroll drop column Department,column Address;
Alter table Employee_Payroll add PhoneNumber varchar(10) ,Address varchar(200) , Department varchar(50) default 'CSE';
 

/*UC9 -Added coloumn basic pay,taxable income,deduction,Net pay*/

Alter table Employee_Payroll add BasicPay Decimal , Deduction decimal, TaxablePay decimal, Incometax Decimal, NetPay decimal;
update Employee_Payroll set PhoneNumber='9988774458' ,Address='100/554',Department ='CSE'  where id =1;
update Employee_Payroll set PhoneNumber='7744885566' ,Address='442/114',Department ='PHY'  where id =2;
update Employee_Payroll set PhoneNumber='8778447788' ,Address='111/444',Department ='CHE'  where id =3
update Employee_Payroll set BasicPay=75000 where id =1;
update Employee_Payroll set BasicPay=80000 where id =2;
update Employee_Payroll set BasicPay=75000 where id =3;


/*UC10 -Add info about tersa working in two different department*/

INSERT INTO Employee_Payroll  values('Singh',75000,'2021-04-05','F','1234567890','112/234','HR',60000,10000,2300,1200,7203);
INSERT INTO Employee_Payroll  values('Singh',75000,'2021-03-15','F','1234567890','112/234','Marketing',60000,10000,2300,1200,7203);


/*UC11- ER- Representation*/

use Payroll_service;
create Table Employee_Service(
service_id int identity(1,1),
Employee_id int FOREIGN Key references Employee_Payroll(id),
Department_id int FOREIGN Key references EMP_DEPARTMENT(department_id),
);
select * from Employee_Service;
select * from EMP_DEPARTMENT;
select * from Employee_Payroll;
insert into Employee_Service values(2,3);
select Employee_Payroll.Name,EMP_DEPARTMENT.department_name from ((Employee_Service inner join Employee_Payroll on Employee_Service.service_id=Employee_Payroll.id)inner join EMP_DEPARTMENT on Employee_Service.service_id=Employee_Payroll.id); 

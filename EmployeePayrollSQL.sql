/*UC1 UC2 DataBase Created and Employee_Payroll Created*/
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



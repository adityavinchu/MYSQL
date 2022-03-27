
/*UC1-Ability to create a Address Book Service DB*/

create database Addressbook;

/*UC2-Ability to create a Address Book Table with its attributes*/
use Addressbook;
CREATE TABLE Addressbook
(
id int primary KEY IDENTITY(1,1),
Firstname varchar(20),
Lastname varchar(20),
Address varchar(50),
City varchar(20),
State varchar(20),
Zip varchar(20),
Phonenumber varchar(20),
Email varchar(50),
);

SELECT * from Addressbook;


/*UC3-Ability to insert new Contacts to Address Book*/

INSERT into Addressbook values ('akash','patil','baramati','pune','maharashtra','413106','7847487744','akashpatil@gmail.com')
INSERT into Addressbook values ('anil','shinde','indapur','pune','maharashtra','413106','7547488755','anilshinde@gmail.com')
INSERT into Addressbook values ('pratik','kushire','bengaloru','bengalore','karnataka','556688','9898997744','pratikkushire@gmail.com')
INSERT into Addressbook values ('siddharth','patil','vasai','mumbai','maharashtra','413188','7874755466','siddharthpatil@gmail.com')
INSERT into Addressbook values ('parth','mane','hadapsar','pune','maharashtra','414744','6585749877','parthmane@gmail.com')
INSERT into Addressbook values ('aniket','kale','indapur','pune','maharashtra','413106','8996658877','aniketkale@gmail.com')

SELECT * from Addressbook;


/*UC4-Ability to edit existing contact person using Firstname*/

UPDATE Addressbook set Phonenumber='8587478855' where Firstname='anil';
SELECT * from Addressbook;


/*UC5-Ability to DELETE a person using person's name*/

DELETE from Addressbook where Firstname = 'aniket'
SELECT * from Addressbook;


/*UC6-Ability to Retrieve Person belonging to a City or State from the Address Book*/

SELECT * from Addressbook where state = 'karnataka'
SELECT * from Addressbook  where state = 'indapur'
SELECT * from Addressbook  where city = 'pune'


/*UC7- Ability to understand the COUNT of address book by City and State*/

SELECT COUNT(*) from Addressbook
SELECT COUNT(*) from Addressbook where city = 'baramati'
SELECT COUNT(*) from Addressbook where city = 'pune'
SELECT COUNT(*) from Addressbook where State = 'maharashtra'


/*UC8-Ability to retrieve entries sorted alphabetically by Person’s name for a given city*/

SELECT * from Addressbook ORDER BY Firstname 
SELECT * from Addressbook GROUP BY city ORDER BY Firstname


/*UC9-Ability to identify each Address Book with name and type*/

ALTER TABLE Addressbook add add_name varchar(20), type varchar(20)

update Addressbook set add_name = 'Adr1', type = 'Profession' where id =1
update Addressbook set add_name = 'Adr1', type = 'Friend' where id =2
update Addressbook set add_name = 'Adr2', type = 'Family' where id =3
update Addressbook set add_name = 'Adr1', type = 'Friend' where id =4
update Addressbook set add_name = 'Adr3', type = 'Profession' where id =5
update Addressbook set add_name = 'Adr3', type = 'Family' where id =6

SELECT * from Addressbook 


/*UC10- Ability to get number of contact persons i.e. count by type*/

SELECT COUNT(type) from Addressbook 


/*UC11-Ability to add person to both Friend and Family*/

INSERT into Addressbook  values ('Amol','gawade','sadashivpeth','pune','Maharashtra','411033','7887447755','amolgawade@gmail.com','Adr3','Friend')
INSERT into Addressbook  values ('Akshay','borole','hadapsar','pune','Maharashtra','432033','8665986565','akshayborole@gmail.com','Adr2','Family')

SELECT * from Addressbook 


/*UC12-Draw the ER Diagram*/

CREATE TABLE  type
(
	type_id int PRIMARY KEY IDENTITY(1,1),
	type_name varchar(30)
);


SELECT * from type
SELECT * from Addressbook 
DROP table type
alter table Addressbook  DROP column type_id

INSERT into type values ('Friend')
INSERT into type values ('Profession')
INSERT into type values ('Family')


ALTER TABLE Addressbook  drop column type

CREATE TABLE address_book_service
(
	id int PRIMARY KEY IDENTITY(1,1),
	adr_id int FOREIGN KEY REFERENCES Addressbook (id),
	type_id int FOREIGN KEY REFERENCES type(type_id)
);

SELECT * from type
SELECT * from address_book_service
SELECT * from Addressbook

SELECT Addressbook.address, address_book_service.id,Addressbook .Firstname From Addressbook  INNER JOIN address_book_service on address_book_service.id = Addressbook .id

SELECT * From Addressbook  INNER JOIN address_book_service on address_book_service.id = Addressbook .id
SELECT * From address_book_service RIGHT JOIN type on address_book_service.type_id = type.type_id
SELECT * From address_book_service LEFT JOIN type on address_book_service.type_id = type.type_id

# Create a DataBase

#DD1,DML,DQL,DCL,TCL

# DD1

create database BankingDB;

# Run the Query -Clrt + Ent

SHOW databases;

# Use the database
use bankingDB;

use sys;


# create database

create database BankingDB; #Apply (;) to close the query

# shortcut key to run the query (Ctrl + ent)
# use database

use bankingdb;

# Create a table 

create table Customers(
Customerid int,
First_name varchar(255),
last_name varchar(255),
email varchar(20),
phone bigint
);


# DQL
select * from customers;


# Alter -- modifing the table after the certion

Alter table customers rename client;

select * from customers;


alter table client rename Customers;

# add columns

alter table customers add column address varchar(20),add column pincode int,
add column country varchar(20);

select * from customers;

# Change column name
alter table customers change column address location varchar(20);

alter table customers modify pincode varchar(20);
#Alter --

-- rename
-- add column
-- change column
-- modify -change only their datatypes

#use the database

use bankingdb;

select * from customers;

#alter table customers drop column location,drop column pincode,drop column country;

select * from customers;

# Add a column (AccountCreationDate )
alter table customers add column AccountCreationDate date;

select * from customers;

use bankingdb;
# 2nd table create
create table Accounts (
Accountid int,
Account_type varchar(20),
Balance decimal(10,2)
);

# 3rd table create
create table Transactions(
TransactionID int,
Transaction_Date date,
Amount decimal(10,2),
Transaction_type varchar(20)
);

# 4th table create

create table Branches(
BranchID int,
Branch_name varchar(100),
Branch_Address varchar(200),
Branch_phone varchar(15)
);

#5th table create
create table Account_Branches(
Assignment_date date
);

#6th table create
create table loans(
LoanID int,
loan_amount decimal(10,2),
interest_rate decimal(10,2),
Start_date date,
End_date date
);

# Add column DOB in customers

alter table customers add column date_of_birth date;

# Delete the table Account Branches

drop table account_branches;


use bankingdb;
select * from customers;

# alter
# primary key
alter table customers modify customerid int primary key;
alter table customers modify email varchar(20) int primary key;

alter table accounts modify Accountid int  primary key;
alter table branches modify BRANCHID int primary key;

alter table loans modify loanid int primary key;
alter table transactions modify TransactionID int primary key;


# Unique
alter table customers modify phone bigint unique;

#check 

# not null

alter table customers modify first_name varchar(25) not null;

#Dml commands
# Insert
select * from customers;


insert into customers (customerid,first_name,last_name,email,phone,accountcreationdate,date_of_birth) values
(101,"piyush","jamgade","piyush@gmail",927397928,"2026-10-11",'2004-10-19');

insert into customers (customerid,first_name,last_name,email,phone,accountcreationdate,date_of_birth) value
(102,"durgesh","hiwarkar","dur@gmail",98374893,"2026-10-11",'2004-11-10');

insert into customers (customerid,first_name,last_name,email,phone,accountcreationdate,date_of_birth) value
(103,"shruti","kumbhare","Shu@gmail",8346928,"2026-10-11",'2004-11-11'),
(104,"ujwala","charde","ujwala@gmail",873648927,"2026-10-11",'2004-11-29');

select * from customers;

insert into customers (customerid,first_name,email) values 
(105,"dishank","dis@gmail");

use bankingdb;
select * From customers;

# is null

select * from customers
where phone is null;

# is not null

select * from customers
where phone is not null;

use bankingdb;
select * from accounts;

# insert the records

insert into accounts values
(202,"Saving",30000,102),
(203,"Current",50000,103),
(204,"Salary",70000,104);

select * from accounts;

select distinct account_type from accounts;

# Aggregation function
# sum,min,max,avg,count

use bankingdb;
select * from customers;

select * from accounts;

select avg(balance) from accounts;

select count(balance) from accounts;


#Datedifference between the two dates

use bankingdb;
select * from customers;

select *,datediff(CURDATE(),date_of_birth) from customers;

select *,datediff(Accountcreationdate,date_of_birth) from customers;

# date add with the interval

select *,date_add(date_of_birth, interval 1 day ) from customers;

select *,date_add(date_of_birth, interval -20 day ) from customers;

# datesubstract

select *,date_sub(date_of_birth, interval 20 year ) from customers;

select * from customers;

select *,upper(first_name) from customers;

select * from customers;

SELECT first_name, LOWER(first_name) AS LowerCaseName FROM customers;

SELECT first_name, LEFT(first_name,3) AS Initials FROM customers;

SELECT CONCAT(first_name,' - ',last_name) AS FullName FROM customers;

SELECT ROUND(1256.75) AS Rounded_Value;

SELECT CEIL(69.25) AS Ceiling_Value;

select * from customers;

SELECT CURDATE(); 

SELECT NOW();

SELECT CustomerID, YEAR(Date_Of_Birth) AS BirthYear FROM customers;

SELECT CustomerID, MONTH(Date_Of_Birth) AS BirthMonth FROM customers;

SELECT CustomerID, DATEDIFF(CURDATE(),Date_Of_Birth) AS Days FROM customers;

SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

select * from accounts;
SELECT SUM(Balance) as total_balance FROM Accounts;

SELECT AVG(Balance) AS average_balance FROM Accounts;

SELECT MAX(Balance) AS highest_balance FROM Accounts;

SELECT MIN(Balance) AS lowest_balance FROM Accounts;

SELECT COUNT(*) AS total_accounts FROM Accounts;

SELECT Account_Type,SUM(Balance) AS TotalBalance FROM Accounts GROUP BY Account_Type;

SELECT Account_Type,SUM(Balance) AS TotalBalance FROM Accounts
GROUP BY Account_Type 
HAVING SUM(Balance) > 25000;

use bankingdb;
select * from customers;
insert into customers (customerid,first_name,last_name,email,phone,accountcreationdate,date_of_birth) values
(106,"Natasha","shende","natasga@gmail",949837461,"26-10-11","2004-11-29");

select * from accounts;

# Joins

# Inner join - Return only matching records from both table

select * from customers c
inner join accounts a
ON c.customerid =a.customerid;

# Left join

select * from customers c 
left join accounts a
ON c.customerid = a.customerid;

# Right join

select * from customers c 
right join accounts a
ON c.customerid = a.customerid;

# Full join

select * from customers c 
left join accounts a
ON c.customerid = a.customerid
union
select * from customers c 
right join accounts a
ON c.customerid = a.customerid;

# Cross join

select * from customers
cross join accounts;

use bankingdb;

 select * from transactions;
 alter table transactions add accountid int;

# Insert in transaction

insert into transactions values
(301,"2025-05-10",20000,"Deposit",201),
(302,"2025-05-11",10000,"Withdrawl",202),
(303,"2025-05-12",3000,"Deposit",203),
(304,"2015-05-13",5000,"Withdrawl",204);

# inner join
select * from accounts;
select * from transactions;


DESCRIBE Accounts;
SELECT
    a.AccountID,
    a.Balance,
    t.TransactionID,
    t.Transaction_Date,
    t.Transaction_type,
    t.Amount
FROM Accounts a
LEFT JOIN Transactions t
    ON a.AccountID = t.AccountID;
    
    
# Sub query

select *,
(select avg(Balance) from accounts) as Avg_Bal,
(select avg(Balance) from accounts) as Max_Bal,
(select avg(Balance) from accounts) as Min_Bal
from accounts;

use bankingdb;
select * from transactions;
SELECT * FROM Transactions
WHERE Amount > (SELECT AVG(Amount) FROM Transactions);

select*,
sum(Balance) over (partition by account_type) from accounts;

update accounts set salary =30000 where accountid =201;

# ranking WF

# rank

select *,
rank() over(order by Balance desc) from accounts;

select *,
dense_rank() over(order by Balance desc) from accounts;

select *,
row_number() over(order by Balance desc) from accounts;

select *,
dense_rank() over(partition by account_type order by Balance desc)
from accounts;

# value WF

# lag -previous one

select *,
lag(Balance) over(partition by account_type order by Balance)
from accounts;

select *,
lead(Balance) over(partition by account_type order by Balance)
from accounts;

select *,
first_value(Balance) over(partition by account_type order by Balance desc)
from accounts;

select *,
last_value(Balance) over(partition by account_type order by Balance desc)
from accounts;

select *,
nth_value(Balance,3) over(partition by account_type order by Balance)
from accounts;

use bankingdb;

select * from loans;
USE bankingdb;

USE bankingdb;

SELECT customerid
FROM loans
ORDER BY customerid;

DESCRIBE customers;
USE bankingdb;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO loans
(loan_id, loan_amount, interest_rate, CustomerID)
VALUES
(301, 100000, 9.5, 101),
(302, 50000, 8.5, 102),
(303, 1500000, 10.0, 103),
(304, 870000, 7.0, 104),
(305, 30000, 5.0, 105);

SELECT * FROM loans;

select *,
rank() over (order by loan_amount desc) from loans;

select *,
dense_rank() over (order by loan_amount desc) from loans;

select *,
row_number () over (order by loan_amount desc) from loans;


select *,
dense_rank() over (partition by customerid order by loan_amount desc) from loans;

select sum(loan_amount) from loans;

select *,
lag (loan_amount) over (order by loan_amount desc) from loans;

select *,
lead (loan_amount) over (order by loan_amount desc) from loans;


# IF

select *,if(balance>=50000,"high_balance","Low_balance") as balance_comp from accounts;

# case

select *,
case
when balance >= 70000 then "very high bal"
when balance >= 50000 then "high bala"
when balance >= 40000 then "medium bala"
else "low bal"
end as a
from accounts;


select *,if(balance >= 25000 and account_type ="saving","loan accept","reject") from accounts;

#Foreign key

use bankingdb;
select * from customers;
select * from accounts;
update accounts set customerid =105 where accountid =205;

alter table accounts add constraint foreign key (customerid) references customers(customerid);

select * from loans;

alter table loans add constraint foreign key (customerid) references customers(customerid);

select * from transactions;

alter table transactions add constraint foreign key (accountid) references accounts(accountid);

use bankingdb;

select * from loans;

use bankingdb;

select * from loans;

# creating a virtual table with the help of view;

create view Loan_shruti as 
select loan_id,loan_amount,end_date,customerid from loans
where loan_amount >=100000;

select * from loan_shruti
where loan_amount >=150000;


# index

use movies;
select * from movie

where genre = "action"

create view index ind_genre on movie (genre(255));


use bankingdb;
select * from accounts;
CREATE VIEW High_Balance_Accounts AS
SELECT
    AccountID,
    Account_Type,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance > 30000;

SELECT *
FROM High_Balance_Accounts;

select * from transactions;
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT
    a.AccountID, a.Account_Type, a.Balance, a.CustomerID,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000;

SELECT *
FROM High_Balance_Accounts;

SELECT
    AccountID,
    Account_Type,
    Balance,
    CustomerID,
    TransactionID,
    TransactionDate,
    TransactionType,
    Amount
FROM High_Balance_Accounts
ORDER BY Balance DESC;

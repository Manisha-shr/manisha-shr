Problem Statement: You are the database developer of an international bank.
You are responsible for managing the bank’s database.
You want to use the data to answer a few questions about your customers regarding withdrawal, deposit and so on, especially about the transaction amount on a particular date across various regions of the world.
Perform SQL queries to get the key insights of a customer. 
Dataset: The 3 key datasets for this case study are: 
a. Continent: The Continent table has two attributes i.e., region_id and region_name, where region_name consists of different continents such as Asia, Europe, Africa etc., assigned with the unique region id. 
b. Customers: The Customers table has four attributes named customer_id, region_id, start_date and end_date which consists of 3500 records.
 c. Transaction: Finally, the Transaction table contains around 5850 records and has four attributes named customer_id, txn_date, txn_type and txn_amount. 
1. Display the count of customers in each region who have done the transaction in the year 2020. 
A. SELECT COUNT(STARTDATE)FROM CUST
SELECT STARTDATE FROM CUST WHERE STARTDATE LIKE 2020;

2. Display the maximum and minimum transaction amount of each transaction type. 
A. SELECT MAX(TXTAMT) FROM TRANS
   SELECT MIN(TXTAMT) FROM TRANS

3. Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000. 
A. SELECT REGION_NAME , TXTAMT FROM TRANS2 WHERE TXTAMT>2000;

4. Find duplicate records in the Customer table.
A. SELECT * FROM CUST;

 5. Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit. 
A. CREATE TABLE CUST3 (CUSTOMER_ID INT, REGION_ID INT,REGION_NAME VARCHAR(30), STARTDATE DATE,ENDDATE DATE,AMT INT);

INSERT INTO CUST3 VALUES(1	,89	,'ASIA', '10-JAN-2020'	,' 10-FEB-2020',3000)

 INSERT INTO CUST3 VALUES(2	,90	, 'AFRICA', '20-JAN-2020'	,' 20-FEB-2020',2500)

 INSERT INTO CUST3 VALUES(3	,91,'EUROPE', '15-JAN-2020'	,' 15-FEB-2023',2000)

 INSERT INTO CUST3 VALUES(4, 92,'ANTARTICA','25-JAN-2023',' 25-FEB-2023',1500)

 SELECT * FROM CUST3
 SELECT CUSTOMER_ID,REGION_NAME  FROM CUST3 
 SELECT MIN(AMT) FROM CUST3

6. Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
A.CREATE TABLE CUST2 (CUSTOMER_ID INT, REGION_ID INT,REGION_NAME VARCHAR (30) ,STARTDATE DATE,ENDDATE DATE);

INSERT INTO CUST2 VALUES(1	,89	,'ASIA', '10-JAN-2020'	,' 10-FEB-2020')

 INSERT INTO CUST2 VALUES(2	,90	,'AFRICA',  '20-JAN-2020'	,' 20-FEB-2020')

 INSERT INTO CUST2 VALUES(3	,91, 'EUROPE','15-JAN-2020'	,' 15-FEB-2023')

 INSERT INTO CUST2 VALUES(4, 92,'ANTARTICA','25-JAN-2023',' 25-FEB-2023')

 INSERT INTO CUST2 VALUES(5,93,'AMERICA','25-AUG-2020','30-SEP-2020')

 INSERT INTO CUST2 VALUES(5,93,'AUSTRALIA','31-AUG-2020','25-SEP-2020')

 SELECT *  FROM CUST2 WHERE STARTDATE > 'JUN 2020';
 

 7. Create a stored procedure to insert a record in the Continent table.
 A.CREATE TABLE CONTINENT (REGION_ID INT, REGION_NAME VARCHAR(30));
INSERT INTO CONTINENT VALUES(1,'ASIA',3000);
INSERT INTO CONTINENT VALUES(2,'N.AMERICA',4000);
INSERT INTO CONTINENT VALUES(3,'S.AMERICA',5000);
INSERT INTO CONTINENT VALUES(4,'AFRICA',2000);
INSERT INTO CONTINENT VALUES(5,'AUSTRALIA',3500);
INSERT INTO CONTINENT VALUES(6,'ANTARTICA',4500);
INSERT INTO CONTINENT VALUES (7,'EUROPE',2500);

SELECT * FROM CONTINENT

ALTER TABLE CONTINENT
ADD AMT INT;

 8. Create a stored procedure to display the details of transactions that happened on a specific day.
 A. SELECT *  FROM CUST2 WHERE STARTDATE = '25-AUG-2020';

9. Create a user defined function to add 10% of the transaction amount in a table. 
A.SELECT(SUM(AMT) * 110)/SUM(SUM(AMT)) OVER () as 'Percentage of Total Price' FROM CUST3

10. Create a user defined function to find the total transaction amount for a given transaction type. 
A. SELECT SUM(AMT) FROM CUST3

11. Create a table value function which comprises the columns customer_id, region_id ,txn_date , txn_type , txn_amount which will retrieve data from the above table. 
A. CREATE TABLE TRANS2 (CUSTOMER_ID INT, REGION_ID INT,REGION_NAME VARCHAR(30), TXTDATE DATE,TXTTYPE VARCHAR(30), TXTAMT INT);

INSERT INTO TRANS2 VALUES(1	,89	,'ASIA', '10-JAN-2020',' REGULAR',3000)

 INSERT INTO TRANS2 VALUES(2	,90	,'AFRICA', '20-JAN-2020',' AVERAGE',2500)

 INSERT INTO TRANS2 VALUES(3	,91,'AMERICA', '15-JAN-2020'	,' REGULAR',2000)

 INSERT INTO TRANS2 VALUES(4, 92,'AUSTRALIA','25-JAN-2023',' SMALL',1500)
  SELECT * FROM TRANS2
12. Create a TRY...CATCH block to print a region id and region name in a single column. 
A. SELECT REGION_ID ,REGION_NAME  FROM TRANS2 ;
13. Create a TRY...CATCH block to insert a value in the Continent table.
A. INSERT INTO CONTINENT VALUES(8,'ASIA',3000)
    SELECT *FROM CONTINENT
 14. Create a trigger to prevent deleting a table in a database. 
 A. DELETE FROM  CONTINENT WHERE AMT = 'NULL';
15. Create a trigger to audit the data in a table. 
A. Create table original2 (id int, name varchar(20));
 Create table backups2 (id int, name varchar(20),data_inserted datetime);

create trigger trg_backup2 on original2
for insert
as begin
declare @id int,@name varchar(20)
select @id=id, @name=name from inserted
insert into backups2 values (@id,@name,getdate())
end




17. Display top n customers on the basis of transaction type. 
A. SELECT 'N' FROM CUST;

18. Create a pivot table to display the total purchase, withdrawal and deposit for all the customers.
A. ALTER TABLE CUST ADD PURCHASE INT, WITHDRAWAL INT, DEPOSIT INT;
INSERT INTO CUST VALUES(1	,89	, '10-JAN-2020'	,' 10-FEB-2020',3000,2000,5000);

INSERT INTO CUST VALUES(2	,90	, '15-JAN-2020'	,' 15-FEB-2020',2000,3000,4000);

SELECT* FROM CUST                
											  TABLES FOR ANSWERS

CREATE TABLE CONTINENT (REGION_ID INT, REGION_NAME VARCHAR(30));
INSERT INTO CONTINENT VALUES(1,'ASIA');
INSERT INTO CONTINENT VALUES(2,'N.AMERICA');
INSERT INTO CONTINENT VALUES(3,'S.AMERICA');
INSERT INTO CONTINENT VALUES(4,'AFRICA');
INSERT INTO CONTINENT VALUES(5,'AUSTRALIA');
INSERT INTO CONTINENT VALUES(6,'ANTARTICA');
INSERT INTO CONTINENT VALUES (7,'EUROPE');

SELECT * FROM CONTINENT

CREATE TABLE CUST (CUSTOMER_ID INT, REGION_ID INT, STARTDATE DATE,ENDDATE DATE);

INSERT INTO CUST VALUES(1	,89	, '10-JAN-2020'	,' 10-FEB-2020')

 INSERT INTO CUST VALUES(2	,90	, '20-JAN-2020'	,' 20-FEB-2020')

 INSERT INTO CUST VALUES(1	,91, '15-JAN-2020'	,' 15-FEB-2023')

 INSERT INTO CUST VALUES(2, 92,'25-JAN-2023',' 25-FEB-2023')

 SELECT * FROM CUST


CREATE TABLE TRANS (CUSTOMER_ID INT, REGION_ID INT, TXTDATE DATE,TXTTYPE VARCHAR(30), TXTAMT INT);

INSERT INTO TRANS VALUES(1	,89	, '10-JAN-2020'	,' REGULAR',3000)

 INSERT INTO TRANS VALUES(2	,90	, '20-JAN-2020'	,' AVERAGE',2500)

 INSERT INTO TRANS VALUES(3	,91, '15-JAN-2020'	,' REGULAR',2000)

 INSERT INTO TRANS VALUES(4, 92,'25-JAN-2023',' SMALL',1500)

 SELECT * FROM TRANS

 CREATE TABLE TRANS2 (CUSTOMER_ID INT, REGION_ID INT,REGION_NAME VARCHAR(30), TXTDATE DATE,TXTTYPE VARCHAR(30), TXTAMT INT);

INSERT INTO TRANS2 VALUES(1	,89	,'ASIA', '10-JAN-2020'	,' REGULAR',3000)

 INSERT INTO TRANS2 VALUES(2	,90	,'AFRICA', '20-JAN-2020'	,' AVERAGE',2500)

 INSERT INTO TRANS2 VALUES(3	,91,'AMERICA', '15-JAN-2020'	,' REGULAR',2000)

 INSERT INTO TRANS2 VALUES(4, 92,'AUSTRALIA','25-JAN-2023',' SMALL',1500)
  SELECT * FROM TRANS2

---LOCATION TABLE

CREATE TABLE LOCATION(Loc_ID INT ,City VARCHAR(30));
INSERT INTO LOCATION VALUES (122,' New York');
INSERT INTO LOCATION VALUES(123, 'Dallas');
INSERT INTO LOCATION VALUES(124, 'Chicago');
INSERT INTO LOCATION VALUES(167 ,'Boston');

---DEPARTMENT TABLE
 
 CREATE TABLE DEPT(Department_Id INT, Name VARCHAR(30), Location_Id INT);
 INSERT INTO DEPT VALUES(10 ,'Accounting', 122);
INSERT INTO DEPT VALUES (20 ,'Sales', 124);
INSERT INTO DEPT VALUES (30 ,'Research', 123);
INSERT INTO DEPT VALUES(40 ,'Operations', 167);
SELECT * FROM DEPT

---JOB TABLE

 CREATE TABLE JOB(Job_ID INT, DESN VARCHAR(30));
 INSERT INTO JOB VALUES
 (667 ,'Clerk');
 INSERT INTO JOB VALUES
(668, 'Staff');
INSERT INTO JOB VALUES
(669 ,'Analyst');
INSERT INTO JOB VALUES
(670 ,'Sales Person');
INSERT INTO JOB VALUES
(671 ,'Manager');
INSERT INTO JOB VALUES
(672 ,'President');
INSERT INTO JOB VALUES
(673,'Accounting');
INSERT INTO JOB VALUES
(674,'Research');

 CREATE TABLE JOB2(Job_ID INT, DESN VARCHAR(30), SALARY INT);
 INSERT INTO JOB2 VALUES
 (667 ,'Clerk',4000);
 INSERT INTO JOB2 VALUES
(668, 'Staff',2850);
INSERT INTO JOB2 VALUES
(669 ,'Analyst',4000);
INSERT INTO JOB2 VALUES
(670 ,'Sales Person',3000);
INSERT INTO JOB2 VALUES
(671 ,'Manager',2000);
INSERT INTO JOB2 VALUES
(672 ,'President',1000);
INSERT INTO JOB2 VALUES
(673,'Accounting',1500);
INSERT INTO JOB2 VALUES
(674,'Research',1700);

---EMPLOYEE TABLE 

 CREATE TABLE EMP(Employee_Id INT,Last_Name varchar(30),First_Name varchar(30),
Middle_Name varchar(30),
Job_Id INT,
Hire_date Date , Salary INT, Comm varchar(30),
Department_Id INT);

INSERT INTO EMP VALUES (7369 ,'Smith ','John', 'Q' ,667 ,'17-Dec-84', 800, Null,20);
INSERT INTO EMP VALUES
(7499 ,'Allen' ,'Kevin' ,'J' ,670 ,'20-Feb-85' ,1600, 300 ,30);
INSERT INTO EMP VALUES
(755 ,'Doyle', 'Jean', 'K' ,671, '04-Apr-85', 2850, Null, 30);
INSERT INTO EMP VALUES
(756 ,'Dennis' ,'Lynn',' S' ,671, '15-May-85', 2750, Null, 30);
INSERT INTO EMP VALUES
(757 ,'Baker', 'Leslie',' D' ,671,' 10-Jun-85', 2200, Null ,40);
INSERT INTO EMP VALUES
(7521 ,'Wark' ,'Cynthia' ,'D', 670, '22-Feb-85', 1250, 50, 30);


---Simple Queries:

---1. List all the employee details.
A. 
SELECT * FROM EMP
--2. List all the department details.
A.
SELECT * FROM DEPT
---3. List all job details.
A. 
SELECT * FROM JOB
--4. List all the locations.
A. SELECT * FROM LOCATION
--5. List out the First Name, Last Name, Salary, Commission for all Employees.
A. SELECT FIRST_NAME ,LAST_NAME ,SALARY ,Comm FROM EMP;
---6. List out the Employee ID, Last Name, Department ID for all employees and alias
Employee ID as "ID of the Employee", Last Name as "Name of the
Employee", Department ID as "Dep_id". 
SELECT LAST_NAME as "Name of the employee",Employee_Id AS "ID of the Employee" ,Department_Id as "Dep_id" FROM EMP;

--7. List out the annual salary of the employees with their names only. 
A. SELECT SALARY, FIRST_NAME FROM EMP;

WHERE Condition:

1. List the details about "Smith". 
A. SELECT * FROM EMP WHERE First_Name ='SMITH';
2. List out the employees who are working in department 20. 
A. SELECT * FROM EMP WHERE Department_Id =20;

3. List out the employees who are earning salaries between 3000 and 4500. 
A. SELECT * FROM EMP WHERE Salary BETWEEN 3000 AND 4500;

4. List out the employees who are working in department 10 or 20.
A. SELECT * FROM EMP WHERE Department_Id between 10 AND 20;
5. Find out the employees who are not working in department 10 or 30. 
A. SELECT * FROM EMP WHERE Department_Id NOT between 10 AND 20;
6. List out the employees whose name starts with 'S'.
A. SELECT * FROM EMP WHERE First_name like '%S%';
7. List out the employees whose name starts with 'S' and ends with 'H'.
A. SELECT * FROM EMP WHERE First_name like '%S___H%';

8. List out the employees whose name length is 4 and start with 'S'.
A. SELECT * FROM EMP WHERE First_name like '%S___%';

9. List out employees who are working in department 10 and draw salaries more
than 3500. 
A. SELECT *FROM EMP Where Department_Id = 10 and Salary=3500;

10. List out the employees who are not receiving commission. 
A. SELECT First_name ,Comm FROM EMP where Comm like 'NULL';

ORDER BY Clause:
1. List out the Employee ID and Last Name in ascending order based on the
Employee ID. 
A. SELECT Employee_Id, Last_name from emp Order by Employee_Id;

2. List out the Employee ID and Name in descending order based on salary. 
A. SELECT Employee_Id, First_name ,Salary from emp Order by Salary;

3. List out the employee details according to their Last Name in ascending-order. 
A. SELECT * FROM EMP  Order by Last_name;

4. List out the employee details according to their Last Name in ascending
order and then Department ID in descending order. 
A. SELECT * FROM EMP  Order by Last_name ;
   SELECT* FROM EMP ORDER BY Department_Id;

GROUP BY and HAVING Clause:

1. How many employees are in different departments in the organization?
A. SELECT * FROM DEPT;

2. List out the department wise maximum salary, minimum salary and average salary of the employees. 
A. SELECT MAX(Salary) AS MAX , MIN(Salary)AS MIN, AVG (Salary) AS AVG FROM EMP;
 
3. List out the job wise maximum salary, minimum salary and average salary of the employees. 
A. SELECT MAX(Salary)as maxjob, MIN(Salary)as minjob, AVG(Salary) as avgjob FROM EMP Group BY Salary ;

4. List out the number of employees who joined each month in ascending order.
A. SELECT Hire_date  FROM EMP GROUP BY Hire_date;

5. List out the number of employees for each month and year in ascending order based on the year and month.
A. SELECT COUNT(*)
FROM emp
WHERE YEAR(Hire_date) = '1984'
GROUP BY MONTH(Hire_date);

6. List out the Department ID having at least four employees. 
A. SELECT Department_Id from dept;

7. How many employees joined in the month of January?
A.SELECT COUNT(*)
FROM emp
WHERE MONTH(Hire_date)='January' 
GROUP BY YEAR(Hire_date) ;
8. How many employees joined in the month of January or September?
A.SELECT COUNT(*)
FROM emp
WHERE MONTH(Hire_date)='September' 
GROUP BY YEAR(Hire_date);
9. How many employees joined in 1985?
A.SELECT COUNT(*)
FROM emp
WHERE YEAR(Hire_date) = '1985';

10. How many employees joined each month in 1985?
A. SELECT COUNT(*)
FROM emp
WHERE year(Hire_date)='1985' 
GROUP BY MONTH(Hire_date);

11. How many employees joined in March 1985?
A.SELECT COUNT(*)
FROM emp
WHERE year(Hire_date)='1985'
 and   MONTH(Hire_date)='March'
group by (Hire_date);

12. Which is the Department ID having greater than or equal to 3 employees
joining in April 1985?

A. SELECT Department_Id from emp 
where year(Hire_date)='1985'
 and   MONTH(Hire_date)='April'
group by (Hire_date);


Joins:
1. List out employees with their department names. 
A. SELECT   NAME  from DEPT ;

2. Display employees with their designations. 
A. CREATE TABLE DEPT2(Department_Id INT,NAME VARCHAR(30),DEPT_Name VARCHAR(30), Location_Id INT);
 INSERT INTO DEPT2 VALUES(10 ,'A','Accounting', 122);
INSERT INTO DEPT2 VALUES (20 ,'B','Sales', 124);
INSERT INTO DEPT2 VALUES (30 ,'C','Research', 123);
INSERT INTO DEPT2 VALUES (40 ,'D','Operations', 167);

 SELECT* FROM DEPT2;
 SELECT* FROM DEPT3;
 CREATE TABLE DEPT3(Department_Id INT, Name VARCHAR(30), Location_Id INT);
 INSERT INTO DEPT3 VALUES(10 ,'Accounting', 122);
INSERT INTO DEPT3 VALUES (20 ,'Sales', 124);
INSERT INTO DEPT3 VALUES (30 ,'Research', 123);
INSERT INTO DEPT3 VALUES(40 ,'Operations', 167);

3. Display the employees with their department names and regional groups.
A.SELECT * FROM DEPT2 RIGHT JOIN
 .[dbo].DEPT3 on DEPT2.Department_Id=DEPT3.Department_Id; 

4. How many employees are working in different departments? Display with
department names.
A.CREATE TABLE EMP2(Employee_Id INT,Last_Name varchar(30),First_Name varchar(30),
Middle_Name varchar(30),
Job_Id INT,
Hire_date Date , Salary INT, Comm varchar(30),
Department_Id INT);

INSERT INTO EMP2 VALUES (7369 ,'Smith ','John', 'Q' ,667 ,'17-Dec-84', 800, Null,20);
INSERT INTO EMP2 VALUES
(7499 ,'Allen' ,'Kevin' ,'J' ,670 ,'20-Feb-85' ,1600, 300 ,30);
INSERT INTO EMP2 VALUES
(755 ,'Doyle', 'Jean', 'K' ,671, '04-Apr-85', 2850, Null, 30);
INSERT INTO EMP2 VALUES
(756 ,'Dennis' ,'Lynn',' S' ,671, '15-May-85', 2750, Null, 30);
INSERT INTO EMP2 VALUES
(757 ,'Baker', 'Leslie',' D' ,671,' 10-Jun-85', 2200, Null ,40);
INSERT INTO EMP2 VALUES
(7521 ,'Wark' ,'Cynthia' ,'D', 670, '22-Feb-85', 1250, 50, 30);
SELECT * FROM EMP RIGHT JOIN
 .[dbo].EMP2 on EMP.Department_Id=EMP2.Department_Id; 

5. How many employees are working in the sales department?
A. SELECT COUNT(NAME) FROM DEPT WHERE NAME='Sales';

6. Which is the department having greater than or equal to 5 employees?
A.Select Department_Id from EMP WHERE Department_Id >=5;

7.Display the department names in ascending order. 
A. SELECT First_name, Last_name from EMP Order by First_name;

8. How many jobs are there in the organization and Display with designations.
A. SELECT  COUNT(DESN) FROM JOB;
    SELECT DESN FROM JOB;
9. How many employees are working in "New York"?
A. SELECT City FROM LOCATION WHERE City='New York';
10. Display the employee details with salary grades. Use conditional statement to
create a grade column. 
A.CREATE TABLE EMP3(Employee_Id INT,Last_Name varchar(30),First_Name varchar(30),
Middle_Name varchar(30),
Job_Id INT,
Hire_date Date , Salary INT,SalGrade varchar(30), Comm varchar(30),
Department_Id INT);

INSERT INTO EMP3 VALUES (7369 ,'Smith ','John', 'Q' ,667 ,'17-Dec-84', 800,'C', Null,20);
INSERT INTO EMP3 VALUES
(7499 ,'Allen' ,'Kevin' ,'J' ,670 ,'20-Feb-85' ,1600,'B', 300 ,30);
INSERT INTO EMP3 VALUES
(755 ,'Doyle', 'Jean', 'K' ,671, '04-Apr-85', 2850,'A', Null, 30);
INSERT INTO EMP3 VALUES
(756 ,'Dennis' ,'Lynn',' S' ,671, '15-May-85', 2750,'A', Null, 30);
INSERT INTO EMP3 VALUES
(757 ,'Baker', 'Leslie',' D' ,671,' 10-Jun-85', 2200,'A', Null ,40);
INSERT INTO EMP3 VALUES
(7521 ,'Wark' ,'Cynthia' ,'D', 670, '22-Feb-85', 1250,'B', 50, 30);

SELECT* FROM EMP3 ORDER BY SalGrade;


11.Display the employee salary grades and the number of employees
between 2000 to 5000 range of salary.
A. SELECT SalGrade FROM EMP3 WHERE Salary between 2000 and 5000;

12. Display all employees in sales or operation departments.
A. SELECT  Name from DEPT where Name='Sales';

SET Operators:
1. List out the distinct jobs in sales and accounting departments. 
A. SELECT  Name from DEPT where Name='Sales' ;
   SELECT  Name from DEPT where Name= 'Accounting';
2. List out all the jobs in sales and accounting departments. 
A. SELECT  DESN from JOB where DESN='Sales Person' ;
   SELECT  DESN from JOB where DESN= 'Accounting';

3. List out the common jobs in research and accounting departments in ascending order. 

A.SELECT  DESN from JOB where DESN= 'Accounting';
  SELECT  DESN from JOB where DESN= 'Research';

Subqueries:
1. Display the employees list who got the maximum salary.
A. SELECT  MAX(SALARY) FROM EMP;

2. Display the employees who are working in the sales department.
A.SELECT  Name from DEPT where Name='Sales';

3. Display the employees who are working as 'Clerk'.
A.SELECT  DESN from JOB where DESN= 'Clerk';



5. Update the salaries of employees who are working as clerks on the basis of 10%. 
A.SELECT(SUM(Salary) * 110)/SUM(SUM(Salary)) OVER () as 'Percentage of Total Price' FROM JOB2 where DESN= 'Clerk';

6. Delete the employees who are working in the accounting department. 
A. DELETE FROM JOB2 WHERE DESN='Accounting';

7. Display the second highest salary drawing employee details. 
A.SELECT FIRST_name,Salary from
(SELECT *,DENSE_RANK() over( order by Salary desc) SRANK from EMP) as Employee
Where SRANK = 2;
8. Display the nth highest salary drawing employee details.
A. SELECT FIRST_NAME,Salary from
(SELECT *,DENSE_RANK() over( order by Salary desc) SRANK from Employee) as Emp
Where SRANK = Salary;
9. List out the employees who earn more than every employee in department 30. 
A. SELECT * FROM DEPT WHERE Department_Id>=30;
10. List out the employees who earn more than the lowest salary in
department.Find out whose department has no employees. 
A. SELECT MIN(Salary) from EMP
SELECT Salary from EMP WHERE Department_Id = null;
11. Find out which department has no employees.
A. SELECT * FROM JOB
12. Find out the employees who earn greater than the average salary for
their department.
A. SELECT AVG(Salary) from JOB2 
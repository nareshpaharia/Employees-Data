create database emp1;
/* imported the table*/

SELECT * FROM emp1.emp_record;


/*#Q1.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and 
make a list of employees and details of their department.*/

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT FROM emp_record;

/* Q2.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four
*/

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING,
	CASE 
		WHEN Emp_Rating <2 then 'less than two'
		WHEN EMP_RATING > 4 then 'greater than four'
		ELSE 'between two and four'
	END Rating
 FROM emp_record ORDER BY Rating;
 
 /* .Q3.	Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in
 the Finance department from the employee table 
 and then give the resultant column alias as NAME.*/

 SELECT Concat(FIRST_NAME,' ',LAST_NAME) AS 'NAME'
 FROM emp_record WHERE DEPT = 'Finance';
 
 /*Q4.	Write a query to list only those employees who have someone reporting to them. 
         Also, show the number of reporters (including the President).*/
	
   SELECT m.EMP_ID,m.FIRST_NAME AS ManagerName,e.First_Name,
	count(*) OVER(PARTITION BY m.First_Name)
	FROM emp_record m  JOIN emp_record e
    ON e.MANAGER_ID = m.Emp_ID
    ORDER BY m.EMP_ID;
    
    /*Q5. Write a query to list down all the employees from the healthcare and finance departments using union. 
    Take data from the employee record table*/
    
    SELECT * FROM emp_record WHERE dept ='HEALTHCARE'
    UNION ALL
	SELECT * FROM emp_record WHERE dept ='Finance';

/* Q6. Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and 
EMP_RATING grouped by dept. 
Also include the respective employee rating along with the max emp rating for the department*/


SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING,
	max(EMP_RATING) OVER( PARTITION BY DEPT)
	FROM emp_record;
    
/* 7.	Write a query to calculate the minimum and the maximum salary of the employees in each role. 
Take data from the employee record table. */
         
 SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,ROLE,Salary,
	Min(Salary) OVER(PARTITION BY ROLE) Minimum,
    MAX(Salary) OVER(PARTITION BY ROLE) Maximum
 FROM emp_record;        
 
 /* Q8.Write a query to assign ranks to each employee based on their experience. 
 Take data from the employee record table*/
 
SELECT EMP_ID,FIRST_NAME,Exp,RANK() OVER(ORDER BY Exp DESC) FROM emp_record;

/* 9.	Write a nested query to find employees with experience of more than ten years. 
Take data from the employee record table.*/

 SELECT * FROM emp_record WHERE emp_id IN(
 SELECT EMP_ID FROM emp_record WHERE Exp > 10);
 













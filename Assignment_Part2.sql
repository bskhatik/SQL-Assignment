/* Q-1) Display the maximum, minimum and average salary and commission earned.*/

USE hr;
SELECT *FROM emp;

SELECT 
    MAX(SALARY) AS 'Maximum Salary',
    MIN(SALARY) AS 'Minimum Salary',
    AVG(SALARY) AS 'Average Salary'
FROM emp;

SELECT 
    MAX(COMMISSION_PCT) AS 'Maximum Commision',
    MIN(COMMISSION_PCT) AS 'Minimum Commision',
    AVG(COMMISSION_PCT) AS 'Average Commision'
FROM emp;

/* Q-2 Display the department number, total salary payout and total commission payout for
each department.*/

SELECT DEPARTMENT_ID,SUM(SALARY) AS 'Total Salary Payout',SUM(COMMISSION_PCT) AS 'Total Commission'FROM emp
GROUP BY DEPARTMENT_ID;


/* Q3- Display the department number and number of employees in each department */

SELECT DEPARTMENT_ID, count(EMPLOYEE_ID) AS " NUMBER OF EMPLOYEES " FROM EMP
GROUP BY DEPARTMENT_ID;

/* Q-4 Display the department number and total salary of employees in each department.*/

SELECT DEPARTMENT_ID, SUM(SALARY) AS "Total Salary" from Emp GROUP BY DEPARTMENT_ID;

/* Q-5 Display the employee's name who doesn't earn a commission. Order the result set
without using the column name */

SELECT * FROM EMP WHERE COMMISSION_PCT= "0";

/* Q-6 Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately */

SELECT FIRST_NAME,LAST_NAME, DEPARTMENT_ID, 
CASE WHEN COMMISSION_PCT IS NOT NULL THEN "Commision"  ELSE 'No commission' END AS "Commision or Not"
    FROM EMP ;
    
/* Q-7 Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriately */

SELECT FIRST_NAME ,LAST_NAME ,SALARY , COMMISSION_PCT*2 AS " Commision Multiplied by 2" ,
CASE WHEN COMMISSION_PCT="0" THEN "NO COMMISSION" END AS "COMMISION OR NOT"FROM EMP ;

/* Q-8 Display the employee's name, department id who have the first name same as another
employee in the same department */

SELECT * FROM EMP
WHERE FIRST_NAME IN
(
  SELECT FIRST_NAME
  FROM EMP
  GROUP BY FIRST_NAME
  HAVING COUNT(*) > 1
);


-- Q-9 Display the sum of salaries of the employees working under each Manager.

SELECT MANAGER_ID, SUM(SALARY)  AS "SUM OF SALARY"  FROM EMP GROUP BY MANAGER_ID;

-- Q-10 Select the Managers ID, the count of employees working under and the department ID of the manager.

SELECT MANAGER_ID, 
group_concat(distinct DEPARTMENT_ID) AS "department ID of the manager",
count(FIRST_NAME) AS "Number of Emp"
FROM emp Group by MANAGER_ID ;          

/* Q-11 Select the employee name, department id, and the salary. Group the result with the
manager ID and the employee last name should have second letter 'a'  */

SELECT 
Group_concat(FIRST_NAME) as First_Name, 
Group_concat(LAST_NAME) as Last_Name, 
Group_concat(DEPARTMENT_ID) as Department_ID,
Group_concat(SALARY) as Salary ,
MANAGER_ID FROM EMP 
WHERE LAST_NAME LIKE "_a%" GROUP BY MANAGER_ID  ;

/* Q-12 Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id.*/

SELECT DEPARTMENT_ID, avg(SALARY) As "Average of Salary" from Emp group by DEPARTMENT_ID ORDER BY DEPARTMENT_ID asc;

/* Q-13 Select the maximum salary of each department along with the department id */

SELECT max(SALARY) AS "MAXIMUM SALARY" ,DEPARTMENT_ID FROM EMP GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ASC;

/* Q-14 Display the commission, if not null display 10% of salary, if null display a default value 1 */

SELECT 
    CASE
        WHEN COMMISSION_PCT="0" THEN "1"
        ELSE SALARY * 0.10
    END AS "Commission"
FROM EMP;

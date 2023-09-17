CREATE DATABASE HR;
USE HR;
/* i have created emp named table  in csv file using excel than imported that table here */

/* Q1. Display all information in the tables EMP and DEPT.*/
SELECT * FROM DEPT;
SELECT *FROM EMP;

/*    Q-2. Display only the hire date and employee name for each employee. */
SELECT HIRE_DATE, FIRST_NAME FROM EMP;


/* Q-3. Display the ename concatenated with the job ID, separated by a comma and space, and
name the column Employee and Title. */

SELECT CONCAT(TRIM(FIRST_NAME), '   ', ',', JOB_ID) AS 'Employee and Title' FROM emp;   -- used trim because there are many spaces in data --


/* Q-4. Display the hire date, name and department number for all clerks.*/

SELECT HIRE_DATE, FIRST_NAME,LAST_NAME,DEPARTMENT_ID, JOB_ID FROM EMP WHERE TRIM(JOB_ID) LIKE '%CLERK';
-- JOB_ID has many spaces included in data so if i dont trim it than %clerk will not work as clerk will not define at last as space is already available at last so trim must --

/*Q-5. Create a query to display all the data from the EMP table. Separate each column by a
comma. Name the column THE OUTPUT */

SELECT *, CONCAT_WS(',', EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) AS "THE OUTPUT" FROM EMP;


/* Q-6. Display the names and salaries of all employees with a salary greater than 2000 */

SELECT FIRST_NAME,LAST_NAME, SALARY FROM EMP WHERE SALARY>2000;

/* Q-7. Display the names and dates of employees with the column headers "Name" and "Start
Date" */

SELECT concat(trim(FIRST_NAME), ' ',trim(LAST_NAME)) AS 'Name' ,HIRE_DATE as 'Start Date' from emp;


/* Q-8. Display the names and hire dates of all employees in the order they were hired.*/

SELECT FIRST_NAME,LAST_NAME, HIRE_DATE FROM EMP ORDER BY HIRE_DATE ASC ;

/* Q-9. Display the names and salaries of all employees in reverse salary order. */

SELECT FIRST_NAME,LAST_NAME ,SALARY FROM EMP ORDER BY SALARY DESC;

/* Q-10. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order */

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM EMP WHERE COMMISSION_PCT>0  ORDER BY SALARY DESC;


/* Q-11. Display the last name and job title of all employees who do not have a manager */

SELECT LAST_NAME, JOB_ID FROM EMP WHERE MANAGER_ID=0;

/* Q-12. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 */

SELECT LAST_NAME, JOB_ID, SALARY FROM EMP
WHERE (TRIM(JOB_ID) = 'ST_CLERK' OR TRIM(JOB_ID) = 'SA_REP')
AND SALARY NOT IN (2500, 3500, 5000);

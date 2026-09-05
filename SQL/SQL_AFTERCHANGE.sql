
-- DATABASE: CompanyDB1


CREATE DATABASE CompanyDB1;
USE CompanyDB;

-- =========================================
-- TABLE 1: Departments
-- =========================================

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- =========================================
-- TABLE 2: Employees
-- =========================================

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- =========================================
-- TABLE 3: Projects
-- =========================================

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- =========================================
-- INSERT VALUES INTO Departments
-- =========================================

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- =========================================
-- INSERT VALUES INTO Employees
-- =========================================

INSERT INTO Employees VALUES
(101, 'Alice', 50000, 1),
(102, 'Bob', 70000, 2),
(103, 'Charlie', 60000, 2),
(104, 'David', 55000, 3);

-- =========================================
-- INSERT VALUES INTO Projects
-- =========================================

INSERT INTO Projects VALUES
(201, 'Payroll System', 102),
(202, 'Website Development', 103),
(203, 'Recruitment App', 101),
(204, 'Budget Analysis', 104);

-- =========================================
-- QUERY 1: SHOW ALL EMPLOYEES
-- =========================================

SELECT * FROM Employees;

-- =========================================
-- QUERY 2: EMPLOYEES WITH SALARY > 55000
-- =========================================

SELECT emp_name, salary
FROM Employees
WHERE salary > 55000;

-- =========================================
-- QUERY 3: EMPLOYEE NAME WITH DEPARTMENT
-- =========================================

SELECT Employees.emp_name, Departments.dept_name
FROM Employees
JOIN Departments
ON Employees.dept_id = Departments.dept_id;

-- =========================================
-- QUERY 4: HIGHEST SALARY
-- =========================================

SELECT MAX(salary) AS highest_salary
FROM Employees;

-- =========================================
-- QUERY 5: COUNT EMPLOYEES IN EACH DEPARTMENT
-- =========================================

SELECT dept_id, COUNT(*) AS total_employees
FROM Employees
GROUP BY dept_id;

-- =========================================
-- QUERY 6: PROJECT NAME WITH EMPLOYEE NAME
-- =========================================

SELECT Projects.project_name, Employees.emp_name
FROM Projects
JOIN Employees
ON Projects.emp_id = Employees.emp_id;

-- =========================================
-- QUERY 7: EMPLOYEES IN IT DEPARTMENT
-- =========================================

SELECT emp_name
FROM Employees
WHERE dept_id = 2;

-- =========================================
-- QUERY 8: AVERAGE SALARY
-- =========================================

SELECT AVG(salary) AS average_salary
FROM Employees;

-- =========================================
-- QUERY 9: SORT EMPLOYEES BY SALARY DESC
-- =========================================

SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC;

-- =========================================
-- QUERY 10: EMPLOYEES NAME STARTS WITH 'A'
-- =========================================

SELECT *
FROM Employees
WHERE emp_name LIKE 'A%';


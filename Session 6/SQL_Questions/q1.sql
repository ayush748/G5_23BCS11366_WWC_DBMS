-- Ayush Tiwari | UID: 23BCS11366



DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);



INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');


WITH DeptAvg AS (
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
),
SalaryDiff AS (
    SELECT 
        e.emp_id,
        e.name,
        e.dept_id,
        e.salary,
        d.avg_salary,
        ABS(e.salary - d.avg_salary) AS diff
    FROM Employees e
    JOIN DeptAvg d
        ON e.dept_id = d.dept_id
)
SELECT DISTINCT ON (dept_id)
    dept_id,
    name,
    salary,
    avg_salary
FROM SalaryDiff
ORDER BY 
    dept_id,
    diff ASC,      
    salary DESC;   

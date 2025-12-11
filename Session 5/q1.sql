-- Ayush Tiwari | UID: 23BCS11366

-- ==========================
-- DROP TABLES (if they exist)
-- ==========================

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- ==========================
-- CREATE TABLES
-- ==========================

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- ==========================
-- INSERT DATA
-- ==========================

INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);

-- =======================================================
-- FINAL QUERY
-- =======================================================

SELECT 
    d.DeptName,
    COUNT(e.EmpID) AS num_employees,
    ROUND(AVG(e.Salary)) AS avg_salary,
    CASE 
        WHEN COUNT(e.EmpID) = 0 THEN 'No Employees'
        WHEN AVG(e.Salary) >= 60000 THEN 'High Avg'
        WHEN AVG(e.Salary) BETWEEN 50000 AND 59999 THEN 'Medium Avg'
        ELSE 'Low Avg'
    END AS salary_category
FROM Departments d
LEFT JOIN Employees e
    ON d.DeptID = e.DeptID
GROUP BY 
    d.DeptName
ORDER BY 
    d.DeptName;

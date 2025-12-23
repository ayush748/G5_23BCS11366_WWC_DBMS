WITH combined AS (
    SELECT EmpID, Ename, Salary FROM A
    UNION ALL
    SELECT EmpID, Ename, Salary FROM B
),
ranked AS (
    SELECT
        EmpID,
        Ename,
        Salary,
        ROW_NUMBER() OVER (
            PARTITION BY EmpID
            ORDER BY Salary
        ) AS rn
    FROM combined
)
SELECT EmpID, Ename, Salary
FROM ranked
WHERE rn = 1
ORDER BY EmpID;

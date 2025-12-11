-- Ayush Tiwari | UID: 23BCS11366



CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    student_id INT,
    course VARCHAR(50)
);


INSERT INTO Student (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Enrollments (student_id, course) VALUES
(1, 'DBMS'),
(3, 'Java'),
(5, 'Python');   -


SELECT 
    'Ayush Tiwari - UID: 23BCS11366' AS Heading,
    NULL AS student_id,
    NULL AS student_name

UNION ALL

SELECT
    NULL AS Heading,
    s.student_id,
    s.student_name
FROM Student s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

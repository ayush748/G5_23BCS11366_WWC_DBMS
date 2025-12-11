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
(5, 'Python');

select s1.student_id,s1.student_name
from
Student s1
left join
Enrollments s2
on s1.student_id = s2.student_id
 where s2.student_id is null

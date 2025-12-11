-- Ayush Tiwari | UID: 23BCS11366

DROP TABLE IF EXISTS Persons;



CREATE TABLE Persons (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);



INSERT INTO Persons (id, name, age, email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');


WITH DuplicateEmails AS (
    SELECT 
        email,
        MAX(id) AS max_id
    FROM Persons
    GROUP BY email
    HAVING COUNT(*) > 1
)
UPDATE Persons p
SET email = 'duplicate email'
FROM DuplicateEmails d
WHERE p.id = d.max_id;



SELECT * FROM Persons ORDER BY id;

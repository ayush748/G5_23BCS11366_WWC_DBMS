-- Create table
CREATE TABLE person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

-- Insert data
INSERT INTO person (id, email) VALUES
(1, 'ayush@example.com'),
(2, 'tiwari@example.com'),
(3, '23BCS11366@example.com');

DELETE FROM PERSON
WHERE ID IN(
SELECT P1.ID  FROM Person as p1
JOIN PERSON AS P2
ON P1.ID>P2.ID AND P1.EMAIL=P2.EMAIL
);

DELETE FROM  PERSON
WHERE ID IN(
Select id FROM(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY EMAIl order by id ) AS R1
FROM PERSON
) AS temp
where r1>1
)
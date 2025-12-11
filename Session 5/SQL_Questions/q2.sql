-- Ayush Tiwari | UID: 23BCS11366

-- ==========================
-- CREATE TABLE
-- ==========================

DROP TABLE IF EXISTS Triangle;

CREATE TABLE Triangle (
    x INT,
    y INT,
    z INT,
    PRIMARY KEY (x, y, z)
);



INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);



SELECT 
    x, y, z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS is_triangle
FROM Triangle;

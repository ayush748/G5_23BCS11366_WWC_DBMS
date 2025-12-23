WITH cte AS (
    SELECT
        id,
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) AS rn
    FROM Person
)
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM cte
    WHERE rn > 1
);

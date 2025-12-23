SELECT
    ROW_NUMBER() OVER (
        PARTITION BY category
        ORDER BY product DESC
    ) AS product_id,
    product,
    category
FROM products
ORDER BY category, product_id;

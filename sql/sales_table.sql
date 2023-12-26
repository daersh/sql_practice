CREATE TABLE sales (
    code INT AUTO_INCREMENT,    -- 자체적으로 값을 증가시켜줌
    year VARCHAR(4),
    month VARCHAR(2),
    product VARCHAR(50),
    amount DECIMAL(10,2),
    PRIMARY KEY(code)
);

INSERT INTO sales (code, year, month, product, amount) VALUES
(null, '2023', LPAD('1', 2, '0'), 'Product A', 1000.00),
(null, '2023', LPAD('1', 2, '0'), 'Product B', 1500.00),
(null, '2023', LPAD('2', 2, '0'), 'Product A', 2000.00),
(null, '2023', LPAD('2', 2, '0'), 'Product B', 2500.00),
(null, '2023', LPAD('3', 2, '0'), 'Product A', 1200.00),
(null, '2024', LPAD('3', 2, '0'), 'Product B', 1700.00);
commit;

SELECT
        year
	  , month
      , product
      , SUM(amount) AS 'total_sales'
  FROM sales
 GROUP BY YEAR, MONTH, product
  WITH ROLLUP;

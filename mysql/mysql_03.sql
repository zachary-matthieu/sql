USE sql_hr;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees;
 
 USE sql_store;
 
 SELECT 
	order_id,
    IFNULL(shipper_id, 'not assigned') AS shipper
 FROM orders;
 
  SELECT 
	order_id,
    COALESCE(shipper_id, comments,'not assigned') AS shipper
 FROM orders;

SELECT 
	CONCAT(first_name, ' ', last_name) AS customer, 
    IFNULL(phone, 'unknown') AS phone_number 
FROM customers; 

SELECT
	order_id,
    order_date,
    IF(
		YEAR(order_date) = YEAR(NOW()), 
		'Active', 
        'Archived') AS status 
FROM orders;

SELECT 
	p.product_id,
    p.name,
    COUNT(*) AS orders,
    IF(COUNT(*) > 1, 'many times', 'once') AS frequency 
FROM products AS p
JOIN order_items AS oi USING (product_id)
GROUP BY product_id, name;

SELECT 
	CONCAT(first_name, ' ', last_name) AS customer,
    points,
    CASE
		WHEN points < 2000 THEN 'Bronze'
        WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
        WHEN points > 3000 THEN 'Gold'
        ELSE 'Blank'
	END AS tier 
FROM customers
ORDER BY points DESC;


USE sql_invoicing;

CREATE VIEW sales_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales 
FROM clients AS c
JOIN invoices AS i 
	USING (client_id)
GROUP BY client_id, name;

CREATE VIEW client_balance AS 
SELECT 
	c.client_id,
    c.name,
    SUM(i.invoice_total - i.payment_total) AS balance 
FROM clients AS c
JOIN invoices AS i 
	USING (client_id)
GROUP BY client_id, name;

DROP VIEW sales_by_client;

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT 
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date 
FROM invoices 
WHERE (invoice_total - payment_total) > 0;


































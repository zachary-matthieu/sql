USE sql_store;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

ROLLBACK;

START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;

USE sql_invoicing;

USE sql_store;

USE sql_invoicing;

DELIMITER $$

CREATE TRIGGER auto_delete_payment
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invocie_id = OLD.invoice_id;
END $$

DELIMITER ;

SHOW TRIGGERS;

USE sql_invoicing; 

CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
);

SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = OFF

DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE 
	-- AT '2019-05-01'
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN 
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ; 

SHOW EVENTS;

DELIMITER $$ 
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END $$

DELIMITER ; 

CALL get_clients();

SELECT * FROM client_balance;

DELIMITER $$

CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * FROM invoices
    WHERE invoice_total - payment_total > 0;
END $$

DELIMITER ;

DROP PROCEDURE get_invoices_with_balance;

USE sql_invoicing;

CALL get_invoices_with_balance();

DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$

CREATE PROCEDURE get_clients_by_state
	(state CHAR(2))
BEGIN
	SELECT *
    FROM clients AS c
    WHERE c.state = state;
END $$

DELIMITER ;

CALL get_clients_by_state('CA');

DELIMITER $$

CREATE PROCEDURE get_invoices_by_client
	(client_id INT)
BEGIN 
	SELECT * 
    FROM invoices AS i
    WHERE i.client_id = client_id; 
END $$

DELIMITER ;

CALL get_clients_by_state('Vinte');

DROP PROCEDURE IF EXISTS get_invoices_by_client;

CALL get_invoices_by_client(1);




















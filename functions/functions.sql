create function hello(s char(50))
	returns char(50) deterministic 
    return concat("Hello",s,"!");
    
select hello("World");

/* set SQL_SAFE_UPDATES */

SET SQL_SAFE_UPDATES = 0; 
drop table counter;
CREATE TEMPORARY TABLE counter (c INT);
INSERT INTO counter VALUES (0);
DELIMITER //
CREATE FUNCTION counter () RETURNS INT
  BEGIN
    UPDATE counter SET c = c + 1 ;
    RETURN (SELECT c FROM counter LIMIT 1);
  END //
DELIMITER ;
select counter();
SET SQL_SAFE_UPDATES = 1; 
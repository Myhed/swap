use swap;
DELIMITER //
CREATE OR REPLACE PROCEDURE insertUser(IN email VARCHAR(255), IN referrer_id INT)
 DETERMINISTIC
 CONTAINS SQL
 MODIFIES SQL DATA 
BEGIN 
  START TRANSACTION;
    IF referrer_id IS NULL THEN
      INSERT INTO User(`email`) VALUES(email);

    ELSE
      INSERT INTO User(`email`, `referrer_id`) VALUES(email, referrer_id);
    END IF;
  COMMIT;
END //

CREATE OR REPLACE PROCEDURE rankUser(IN id INT)
NOT DETERMINISTIC
BEGIN
    SELECT email, registration_date, (SELECT COUNT(referrer_id) FROM User WHERE referrer_id = id) as `numberReferrer` FROM User ORDER BY numberReferrer,registration_date DESC;
END //

CREATE OR REPLACE FUNCTION insertId()
    RETURNS INT
    DETERMINISTIC    
    MODIFIES SQL DATA
BEGIN
    RETURN 2;
END //


DELIMITER ;
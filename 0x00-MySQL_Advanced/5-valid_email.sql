--trigger for email
DELIMITER //

CREATE TRIGGER update_valid_email 
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    DECLARE is_valid INT;
    
    -- Check if the new email is valid (you may need to adjust this condition)
    SET is_valid = (SELECT 1 FROM DUAL WHERE NEW.email LIKE '%@%');

    -- Update valid_email based on the new email's validity
    IF is_valid THEN
        SET NEW.valid_email = 1;
    ELSE
        SET NEW.valid_email = 0;
    END IF;
END;
//

DELIMITER ;


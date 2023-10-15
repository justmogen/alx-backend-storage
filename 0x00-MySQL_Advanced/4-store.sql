--using triggers to update a store
DELIMITER //

CREATE TRIGGER decrease_quantity_after_order 
AFTER INSERT ON orders 
FOR EACH ROW 
BEGIN
    -- Decrease the quantity of the ordered item
    UPDATE items 
    SET quantity = quantity - NEW.number 
    WHERE name = NEW.item_name;
END;
//

DELIMITER ;


--store updated items using trigger
DELIMITER //

CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE current_quantity INT;
    DECLARE item_name VARCHAR(255);
    
    -- Get the current quantity of the item
    SELECT quantity INTO current_quantity
    FROM items
    WHERE name = NEW.item_name;
    
    -- Get the item name
    SET item_name = NEW.item_name;
    
    -- Update the quantity in the items table
    UPDATE items
    SET quantity = current_quantity - NEW.number
    WHERE name = item_name;
END;
//

DELIMITER ;


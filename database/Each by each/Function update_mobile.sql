DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `update_mobile`(`p_id` VARCHAR(20), `new_mobile` VARCHAR(11)) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
  DECLARE v_count INT;
  DECLARE v_error_message TEXT;
  DECLARE v_success_message TEXT;
  DECLARE temp INT;
  SET v_error_message = 'ID not found';
  SET v_success_message = 'Mobile number updated successfully';
  
  UPDATE donor_registration SET mobile = new_mobile WHERE id = p_id;
  SELECT mobile INTO TEMP FROM donor_registration WHERE id = p_id;
 
  IF temp = new_mobile THEN   
     RETURN v_success_message;
  ELSE
     RETURN v_error_message;
  END IF;
END$$
DELIMITER ;
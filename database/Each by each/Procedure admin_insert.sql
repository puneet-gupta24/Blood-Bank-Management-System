DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_insert`(IN `in_uname` VARCHAR(50), IN `in_pass` VARCHAR(50), IN `in_con_pass` VARCHAR(50), IN `in_name` VARCHAR(50), IN `in_email` VARCHAR(50), IN `in_special_id` VARCHAR(10), OUT `p_message` VARCHAR(255))
BEGIN
DECLARE userc INT DEFAULT 0;
DECLARE isdc INT DEFAULT 0;

	DECLARE foreign_key_error CONDITION FOR 1452;
	DECLARE unique_key_error CONDITION FOR 1062;
		 DECLARE EXIT HANDLER FOR foreign_key_error 
  	  		SET p_message = 'Wrong Special_id';
 		 DECLARE EXIT HANDLER FOR unique_key_error
        	SET p_message = 'Username already exists';
        
IF (in_pass != in_con_pass) THEN
    SET p_message = 'Password and Confirm Password do not match';
ELSE   
    INSERT INTO admin (uname,pass,con_pass,name,email,special_id) VALUES (in_uname,in_pass,in_con_pass,in_name,in_email,in_special_id);
    SET p_message = 'Admin Registration Successful';
    End IF;
END$$
DELIMITER ;
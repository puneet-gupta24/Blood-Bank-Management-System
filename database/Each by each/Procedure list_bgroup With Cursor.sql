DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_bgroup`()
BEGIN
   DECLARE bg VARCHAR(10);
   DECLARE unitss INT;
   DECLARE done INT DEFAULT FALSE;
   DECLARE bgroup_cursor CURSOR FOR SELECT bgroup, units FROM bgroup;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   OPEN bgroup_cursor;

   SET @result = '';
   
   read_loop: LOOP
      FETCH bgroup_cursor INTO bg, unitss;
      IF done THEN
         LEAVE read_loop;
      END IF;

      SET @result = CONCAT(@result, '<tr><td>', bg, '</td><td>', unitss, '</td></tr>');
   END LOOP;

   CLOSE bgroup_cursor;

   SELECT @result;
END$$
DELIMITER ;
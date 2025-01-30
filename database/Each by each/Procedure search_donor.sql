DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_donor`(IN `p_bgroup` VARCHAR(10), IN `p_state` VARCHAR(100))
BEGIN
SELECT dr1.name, dr1.mobile, dr1.bgroup, da.state, dr1.age
  FROM donor_registration dr1
  JOIN donor_registration dr2 ON dr1.id = dr2.id
  JOIN address_d da ON dr2.id = da.id
  WHERE dr1.bgroup = p_bgroup AND da.state = p_state;
  END$$
DELIMITER ;
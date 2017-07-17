CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `numberofrentedmovies` AS
    SELECT 
        COUNT(`R`.`rental_id`) AS `COUNT(R.rental_id)`
    FROM
        ((`film` `F`
        LEFT JOIN `inventory` `I` ON ((`F`.`film_id` = `I`.`film_id`)))
        LEFT JOIN `rental` `R` ON ((`R`.`inventory_id` = `I`.`inventory_id`)))
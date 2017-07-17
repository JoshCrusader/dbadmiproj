CREATE DEFINER=`root`@`localhost` FUNCTION `get_no_latemovies`() RETURNS int(11)
BEGIN
DECLARE no_latemovies INT UNSIGNED;
SELECT COUNT(RENTAL_ID) INTO no_latemovies FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(return_date,rental_date) > F.rental_duration;
RETURN no_latemovies;
END
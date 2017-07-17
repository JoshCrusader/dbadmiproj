CREATE DEFINER=`root`@`localhost` FUNCTION `get_ontime_movies`() RETURNS int(11)
BEGIN
DECLARE on_time_movies INT UNSIGNED;
SELECT COUNT(RENTAL_ID) INTO on_time_movies FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(return_date,rental_date) <= F.rental_duration;
RETURN on_time_movies;
END
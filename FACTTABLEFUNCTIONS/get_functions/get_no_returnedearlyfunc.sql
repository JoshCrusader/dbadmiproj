CREATE FUNCTION `get_no_returnedearly` ()
RETURNS INTEGER
BEGIN
DECLARE no_returnedearly INT UNSIGNED;
SELECT COUNT(RENTAL_ID) INTO no_returnedearly FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(return_date,rental_date) < F.rental_duration;
RETURN no_returnedearly;
END

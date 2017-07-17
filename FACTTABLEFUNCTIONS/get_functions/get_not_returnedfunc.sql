CREATE FUNCTION `get_not_returned` ()
RETURNS INTEGER
BEGIN
DECLARE not_returned INT UNSIGNED;
SELECT COUNT(RENTAL_ID) INTO not_returned FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE return_date is null;
RETURN not_returned;
END

CREATE FUNCTION `get_total_penalties` ()
RETURNS FLOAT
BEGIN
DECLARE total_penalties FLOAT;
SELECT SUM(penalties)INTO total_penalties FROM (SELECT (DATEDIFF(return_date,rental_date)*rental_rate) as 'penalties' FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(return_date,rental_date) > F.rental_duration) AS T;
RETURN total_penalties;
END

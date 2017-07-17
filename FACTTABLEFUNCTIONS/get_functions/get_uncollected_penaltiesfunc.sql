CREATE FUNCTION `get_uncollected_penalties` ()
RETURNS FLOAT
BEGIN
DECLARE uncollected FLOAT;
SELECT SUM(penalties) into uncollected FROM (SELECT (DATEDIFF(R.last_update,rental_date)*rental_rate) as 'penalties' FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(R.last_update,rental_date) > F.rental_duration AND R.return_date is null) AS T;
RETURN uncollected;
END

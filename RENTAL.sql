SELECT DATEDIFF(return_date,rental_date) as days from RENTAL;

SELECT * FROM RENTAL WHERE return_date is null;
SELECT return_date from rental where return_date is null;
SELECT no_rentedmovies() from Actor;

SELECT get_uncollected_penalties() from language;
SELECT COUNT(RENTAL_ID) FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(return_date,rental_date) < F.rental_duration;
                        
SELECT SUM(P.amount) FROM PAYMENT P;

SELECT SUM(penalties) FROM (SELECT (DATEDIFF(R.last_update,rental_date)*rental_rate) as 'penalties' FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(R.last_update,rental_date) > F.rental_duration AND R.return_date is null) AS T;
                        
SELECT (DATEDIFF(R.last_update,rental_date)*rental_rate) as 'penalties' FROM FILM F
						LEFT JOIN INVENTORY I ON F.film_id = I.film_id
						LEFT JOIN RENTAL R ON I.inventory_id = R.inventory_id
                        WHERE DATEDIFF(R.last_update,rental_date) > F.rental_duration AND R.return_date is null;
                        
                        
select R.RENTAL_ID,COUNT(S.STORE_ID),COUNT(CT.CITY_ID),COUNT(F.FILM_ID),COUNT(AC.actor_id) FROM RENTAL R
		 LEFT JOIN INVENTORY I ON I.INVENTORY_ID = R.INVENTORY_ID
		 LEFT JOIN CUSTOMER C ON C.CUSTOMER_ID = R.CUSTOMER_ID
         LEFT JOIN STORE S ON S.STORE_ID = I.STORE_ID
         LEFT JOIN ADDRESS A ON A.ADDRESS_ID = S.ADDRESS_ID
         LEFT JOIN CITY CT ON CT.CITY_ID = A.CITY_ID
         LEFT JOIN COUNTRY CO ON CO.COUNTRY_ID = CT.COUNTRY_ID
         LEFT JOIN FILM F ON F.FILM_ID = I.FILM_ID
         LEFT JOIN LANGUAGE L ON L.LANGUAGE_ID = F.LANGUAGE_ID
		 JOIN FILM_ACTOR FA on FA.FILM_ID = F.FILM_ID
		 LEFT JOIN ACTOR AC ON AC.ACTOR_ID = FA.ACTOR_ID
		 JOIN FILM_CATEGORY FC ON FC.FILM_ID = F.FILM_ID
         LEFT JOIN CATEGORY CAT ON CAT.CATEGORY_ID = FC.CATEGORY_ID
         GROUP BY R.RENTAL_ID;
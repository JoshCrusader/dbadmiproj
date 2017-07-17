-- Migration of customerfact :'(((
INSERT INTO rentallDW.CUSTOMERFACT
-- deadly script here

-- Migration of Cities and Countries

INSERT INTO rentallDW.DIM_COUNTRY
	SELECT  DISTINCT country_id, country
    FROM 	MOVIERENTALDB.country
    WHERE   country_id NOT IN ( SELECT country_id FROM rentallDW.DIM_COUNTRY);
    
INSERT INTO rentallDW.DIM_CITY
	SELECT  DISTINCT ct.city_id, ct.city, cr.country_id
    FROM    MOVIERENTALDB.city ct JOIN MOVIERENTALDB.country cr on ct.country_id = cr.country_id
    WHERE   city_id NOT IN (  SELECT city_id from rentallDW.DIM_CITY);
    
-- Migration of Actors

INSERT INTO rentallDW.DIM_ACTOR
-- script here

-- Migration of Datetimes

INSERT INTO rentallDW.DIM_DATETIME
-- script here

-- Migration of Languagez

INSERT INTO rentallDW.DIM_LANGUAGE
	SELECT language_id, name
	FROM MOVIERENTALDB.language
    WHERE language_id not in (SELECT languageID FROM rentallDW.DIM_language)
    AND name not in (SELECT language FROM rentallDW.DIM_language);
-- script here

-- Migration of Movies

INSERT INTO rentallDW.DIM_MOVIE
	SELECT F.FILM_ID, F.TITLE,  FC.category_id, F.rating,F.rental_duration, F.language_id,F.release_year
    FROM MOVIERENTALDB.film F
    LEFT JOIN MOVIERENTALDB.film_category FC ON F.film_id = FC.film_id
    WHERE F.FILM_ID not in (SELECT movieID FROM rentallDW.DIM_MOVIE);
-- script here

-- Migration of Movie Categories

INSERT INTO rentallDW.DIM_MOVIECATEGORY
	SELECT DISTINCT CATEGORY_ID,NAME
    FROM MOVIERENTALDB.CATEGORY
    WHERE CATEGORY_ID NOT IN (SELECT categoryID FROM rentallDW.DIM_MOVIECATEGORY)
    AND NAME NOT IN (SELECT CATEGORY FROM rentallDW.DIM_MOVIECATEGORY);
-- script here

-- Migration of Movie Years

INSERT INTO rentallDW.DIM_MOVIEYEAR
	SELECT DISTINCT release_year
    FROM MOVIERENTALDB.FILM
    WHERE release_year not in (SELECT movieYEAR FROM rentallDW.DIM_MOVIEYEAR);
-- script here

-- Migration of Ratings

INSERT INTO rentallDW.DIM_RATING
	SELECT DISTINCT RATING
    FROM MOVIERENTALDB.FILM
    WHERE RATING not in (SELECT RATING FROM rentallDW.DIM_RATING);
-- script here

-- Migration of Rental Durations

INSERT INTO rentallDW.DIM_RENTALDURATION
	SELECT DISTINCT rental_duration
    FROM MOVIERENTALDB.FILM
    WHERE rental_duration not in (select duration from rentallDW.DIM_RENTALDURATION);
-- script here

-- Migration of Stores

INSERT INTO rentallDW.DIM_STORE
-- script here

-- Migration of Movie Times

INSERT INTO rentallDW.DIM_TIME
-- script here

-- Migration of RENTAL FACTS >:((((

INSERT INTO rentallDW.RENTALFACT
-- script here



INSERT INTO rentallDW.RENTALFACT
	numberofrentedmovies,0,0,0,0,0,0,0

SELECT * FROM numberofrentedmovies;


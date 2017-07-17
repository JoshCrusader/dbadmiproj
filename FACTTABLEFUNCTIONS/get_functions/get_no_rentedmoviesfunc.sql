CREATE DEFINER=`root`@`localhost` FUNCTION `get_no_rentedmovies`() RETURNS int(11)
BEGIN
DECLARE no_rentedmovies INT UNSIGNED;
SELECT `COUNT(R.rental_id)` INTO no_rentedmovies FROM numberofrentedmovies;
RETURN no_rentedmovies;
END
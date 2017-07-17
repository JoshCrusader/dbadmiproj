CREATE FUNCTION `get_totalsales` ()
RETURNS FLOAT
BEGIN
DECLARE totalsales FLOAT;
SELECT SUM(P.amount) INTO totalsales FROM PAYMENT P;
RETURN totalsales;
END

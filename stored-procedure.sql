SELECT ccnumber FROM challenge;

SET @a = 0;
SET @b = 0;

DROP PROCEDURE IF EXISTS calculus;
DELIMITER //
CREATE PROCEDURE calculus (OUT mean BIGINT(20), OUT median BIGINT(20)/*, OUT md BIGINT(20)*/)
BEGIN
	DECLARE curMe CURSOR FOR
		SELECT AVG(ccnumber) FROM challenge;
	DECLARE curMn CURSOR FOR
		SELECT AVG(cc.ccnumber) as median_val
		FROM (
			SELECT c.ccnumber, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
			FROM challenge c, (SELECT @rownum:=0) r
			WHERE ccnumber is NOT NULL
			ORDER BY c.ccnumber
		) as cc
		WHERE cc.row_number IN (FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2));
	OPEN curMe;
		FETCH curMe INTO mean;
    CLOSE curMe;
    OPEN curMn;
		FETCH curMn INTO median;
    CLOSE curMn;
END;//
DELIMITER ;

CALL calculus(@a, @b)
    
# Query that calculates the median
/* SELECT AVG(cc.ccnumber) as median_val
FROM (
SELECT c.ccnumber, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
  FROM challenge c, (SELECT @rownum:=0) r
  WHERE ccnumber is NOT NULL
  ORDER BY c.ccnumber
) as cc
WHERE cc.row_number IN (FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2)); */


# Another median calculation query (slow)
# SELECT c.ccnumber from challenge c, challenge y
# GROUP BY c.ccnumber
# HAVING SUM(SIGN(1-SIGN(y.ccnumber-c.ccnumber)))/COUNT(*) > .5
# LIMIT 1

DELIMITER //
CREATE PROCEDURE calculate_mean (OUT mean BIGINT(20))
BEGIN
	DECLARE curMe CURSOR FOR
		SELECT AVG(ccnumber) FROM challenge;
	OPEN curMe;
		FETCH curMe INTO mean;
    CLOSE curMe;
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE calculate_median (OUT median BIGINT(20))
BEGIN 
	DECLARE curMn CURSOR FOR
		SELECT AVG(cc.ccnumber) as median_val
		FROM (
			SELECT c.ccnumber, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
			FROM challenge c, (SELECT @rownum:=0) r
			WHERE ccnumber is NOT NULL
			ORDER BY c.ccnumber
		) as cc
		WHERE cc.row_number IN (FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2));
	OPEN curMn;
		FETCH curMn INTO median;
	CLOSE curMn;
END;//
DELIMITER ;

DROP PROCEDURE IF EXISTS calculate_mode;
DELIMITER //
CREATE PROCEDURE calculate_mode (OUT md BIGINT(20))
BEGIN 
	DECLARE curMd CURSOR FOR
		SELECT ccnumber
		FROM (
			SELECT ccnumber
			FROM challenge
			GROUP BY ccnumber
			LIMIT 1) T1;
	OPEN curMd;
		FETCH curMd INTO md;
	CLOSE curMd;
END;//
DELIMITER ;

SET @md = 0;
CALL calculate_mode(@md);
SELECT @md;


# Query to calculate the mode, occurs is the number of times the value is present
/* SELECT ccnumber, occurs
FROM (SELECT ccnumber, count(*) as occurs
     FROM challenge
     GROUP BY ccnumber
     LIMIT 1) T1 */
     
DELIMITER //     
CREATE PROCEDURE calculate_min (OUT min BIGINT(20))
BEGIN
	DECLARE curMin CURSOR FOR
		SELECT min(ccnumber) FROM challenge;
	OPEN curMin;
		FETCH curMin INTO min;	
	CLOSE curMin; 
END;//
DELIMITER ;

DELIMITER //     
CREATE PROCEDURE calculate_max (OUT max BIGINT(20))
BEGIN
	DECLARE curMax CURSOR FOR
		SELECT MAX(ccnumber) FROM challenge;
	OPEN curMax;
		FETCH curMax INTO max;	
	CLOSE curMax; 
END;//
DELIMITER ;


SELECT MAX(ccnumber) FROM challenge;
SELECT MIN(ccnumber) FROM challenge;
	
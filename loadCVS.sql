LOAD DATA LOCAL INFILE 'C:/Users/ccristancho/Documents/Challenges/DB_Challenge/demofile.csv'
INTO TABLE challenge
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'

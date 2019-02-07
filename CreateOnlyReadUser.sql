CREATE USER 'ChallengeOR'@'mysqlchallange.cm6hb8mfglop.us-east-1.rds.amazonaws.com' IDENTIFIED BY '1234567890';
GRANT SELECT ON challenge TO 'ChallengeOR'@'mysqlchallange.cm6hb8mfglop.us-east-1.rds.amazonaws.com';
FLUSH PRIVILEGES;

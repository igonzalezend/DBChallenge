CREATE USER 'ChallengeReadWrite'@'mysqlchallenge.cm6hb8mfglop.us-east-1.rds.amazonaws.com' IDENTIFIED BY '1234567890';
GRANT SELECT ON challenge TO 'ChallengeReadWrite'@'mysqlchallange.cm6hb8mfglop.us-east-1.rds.amazonaws.com';
GRANT UPDATE ON challenge TO 'ChallengeReadWrite'@'mysqlchallange.cm6hb8mfglop.us-east-1.rds.amazonaws.com';
GRANT INSERT ON challenge TO 'ChallengeReadWrite'@'mysqlchallange.cm6hb8mfglop.us-east-1.rds.amazonaws.com';
FLUSH PRIVILEGES;
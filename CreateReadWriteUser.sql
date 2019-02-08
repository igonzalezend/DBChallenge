CREATE USER 'ChallengeRW'@'%' IDENTIFIED BY '1234567890';
GRANT SELECT ON challenge.* TO 'ChallengeRW'@'%';
GRANT UPDATE ON challenge.* TO 'ChallengeRW'@'%';
GRANT INSERT ON challenge.* TO 'ChallengeRW'@'%';
FLUSH PRIVILEGES;
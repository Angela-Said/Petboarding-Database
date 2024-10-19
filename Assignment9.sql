USE petboarding

SELECT user();


CREATE USER angela@localhost 
IDENTIFIED BY 'cgs2545$%';

SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv
FROM mysql.user;



GRANT SELECT, INSERT, UPDATE ON petboarding.* TO angela@localhost;



SHOW GRANTS FOR angela@localhost;

system mysql -u angela -p

USE petboarding 

DELETE FROM pet;

system mysql -u root -p

USE petboarding 


CREATE USER employee@localhost
IDENTIFIED BY 'cgs2545$%';



SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv
FROM mysql.user;


GRANT SELECT, SHOW VIEW ON petboarding.workscheduleview TO employee@localhost;

SHOW GRANTS FOR employee@localhost;

system mysql -u employee -p

USE petboarding

SHOW TABLES;

SELECT * FROM pet;


system mysql -u root -p


REVOKE INSERT, UPDATE ON petboarding.* FROM angela@localhost;

SHOW GRANTS FOR angela@localhost;








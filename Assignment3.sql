USE petboarding;

CREATE TABLE cityStateZip(
    city    VARCHAR(90) NOT NULL, 
    state   CHAR(2)     NOT NULL,
    zipCode CHAR(5)     NOT NULL  UNIQUE,
    PRIMARY KEY(zipCode)
);

INSERT INTO cityStateZip (city, state, zipCode)
SELECT DISTINCT city, state, zipCode
    FROM employee
WHERE zipCode NOT IN 
    (SELECT DISTINCT zipCode
        FROM cityStateZip);
        
INSERT INTO cityStateZip (city, state, zipCode)
SELECT DISTINCT city, state, zipCode
    FROM client
WHERE zipCode NOT IN 
    (SELECT DISTINCT zipCode
        FROM cityStateZip);
        
ALTER TABLE employee
    ADD FOREIGN KEY (zipCode) REFERENCES cityStateZip (zipCode);
    
ALTER TABLE employee
    DROP COLUMN city,
    DROP COLUMN state;
    
ALTER TABLE client
    ADD FOREIGN KEY(zipCode) REFERENCES cityStateZip(zipCode);
    
ALTER TABLE client
    DROP COLUMN city, 
    DROP COLUMN state;
    
CREATE TABLE employeePosition(
    employeeId  INT  NOT NULL  UNIQUE,
    positionId  INT  NOT NULL,
    PRIMARY KEY (employeeId, positionId),
    FOREIGN KEY(positionId) REFERENCES position (ID),
    FOREIGN KEY(employeeId) REFERENCES employee (ID)

    
);

INSERT INTO employeePosition VALUES

    (6, 7),
    (9, 10),
    (7, 5),
    (2, 4),
    (1, 1),
    (8, 3),
    (3, 9),
    (4, 2),
    (10, 6),
    (5, 8)
    ;
    
    
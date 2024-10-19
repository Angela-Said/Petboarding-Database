USE petboarding 

ALTER TABLE PetType RENAME TO pettype;
ALTER TABLE employeePosition RENAME TO employeeposition;
ALTER TABLE clientPet RENAME TO clientpet;
ALTER TABLE cityStateZip RENAME TO citystatezip;

CREATE TABLE color(
    ID    INT         NOT NULL  AUTO_INCREMENT,
    color VARCHAR(20) NOT NULL  UNIQUE,
    PRIMARY KEY(ID)
);

ALTER TABLE color AUTO_INCREMENT = 100;

INSERT INTO color (color)
SELECT DISTINCT color FROM pet; 

UPDATE pet
SET color = 100
WHERE color = 'Brown';

UPDATE pet
SET color = 101
WHERE color = 'Black';

UPDATE pet
SET color = 102
WHERE color = 'White';

UPDATE pet
SET color = 103
WHERE color = 'Golden';


ALTER TABLE pet RENAME COLUMN color TO colorId; 
ALTER TABLE pet MODIFY COLUMN colorId INT NOT NULL;
ALTER TABLE pet ADD FOREIGN KEY (colorId) REFERENCES color (id);


INSERT INTO color(color)VALUES

    ('Tan'),
    ('Brindle'),
    ('Grey'),
    ('Red'),
    ('Blue'),
    ('Sable'),
    ('Tabby'),
    ('Calico'),
    ('Tortoiseshell'),
    ('Pointed')
;

SELECT
    p.name AS "Name",
    pt.description AS "Pet Type",
    b.description AS "Breed",
    c.color AS 'Color'
FROM 
    pet AS p
JOIN 
    breed b ON p.breedId = b.Id
JOIN 
    petType pt ON p.petTypeId = pt.Id
JOIN
    color c ON p.colorId = c.Id
WHERE
    pt.description = 'Dog'
ORDER BY
    p.name;


SELECT 
    p.name AS "Name",
    pt.description AS "Pet Type",
    b.description AS "Breed",
    c.color AS 'Color'
FROM
    pet AS p
JOIN 
    breed b ON p.breedId = b.Id
JOIN
    petType pt ON p.petTypeId = pt.Id
JOIN 
    color c ON p.colorId = c.Id
WHERE
    pt.description = 'Cat'
ORDER BY
    p.name;
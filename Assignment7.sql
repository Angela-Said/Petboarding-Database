USE petboarding 

ALTER TABLE client
DROP FOREIGN KEY client_ibfk_1;

ALTER TABLE client
ADD FOREIGN KEY (zipCode) REFERENCES citystatezip(zipCode) ON UPDATE CASCADE ON DELETE CASCADE;




ALTER TABLE clientpet
DROP FOREIGN KEY clientpet_ibfk_1,
DROP FOREIGN KEY clientpet_ibfk_2;

ALTER TABLE clientpet
ADD FOREIGN KEY (clientId) REFERENCES client(ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD FOREIGN KEY (petId)    REFERENCES pet(ID) ON UPDATE CASCADE ON DELETE CASCADE;




ALTER TABLE employee
DROP FOREIGN KEY employee_ibfk_1;

ALTER TABLE employee
ADD FOREIGN KEY (zipCode) REFERENCES citystatezip(zipCode) ON UPDATE CASCADE ON DELETE CASCADE;




ALTER TABLE employeeposition
DROP FOREIGN KEY employeeposition_ibfk_1,
DROP FOREIGN KEY employeeposition_ibfk_2;

ALTER TABLE employeeposition
ADD FOREIGN KEY (employeeId) REFERENCES employee(ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD FOREIGN KEY (positionId) REFERENCES position (ID) ON UPDATE CASCADE ON DELETE CASCADE;




ALTER TABLE pet
DROP FOREIGN KEY pet_ibfk_1,
DROP FOREIGN KEY pet_ibfk_2;

ALTER TABLE pet
ADD FOREIGN KEY (breedId)   REFERENCES breed(ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD FOREIGN KEY (petTypeId) REFERENCES petType(ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD FOREIGN KEY (colorId)   REFERENCES color(ID) ON UPDATE CASCADE ON DELETE CASCADE;





DELETE FROM pet WHERE name IN ('Bailey', 'Max', 'Milo');




CREATE TABLE timecard(
    ID         INT NOT NULL AUTO_INCREMENT,
    employeeId INT NOT NULL,
    sun        INT NOT NULL DEFAULT 0,
    mon        INT NOT NULL DEFAULT 0,
    tues       INT NOT NULL DEFAULT 0,
    wed        INT NOT NULL DEFAULT 0,
    thurs      INT NOT NULL DEFAULT 0,
    fri        INT NOT NULL DEFAULT 0,
    sat        INT NOT NULL DEFAULT 0,
    PRIMARY KEY(ID),
    FOREIGN KEY(employeeId) REFERENCES employee(ID) ON UPDATE CASCADE ON DELETE CASCADE 
);
 


INSERT INTO timecard(employeeId, sun, mon, tues, wed, thurs, fri, sat) VALUES
    (25, 12, 0, 12, 0, 4, 12, 0),
    (13, 12, 0, 12, 0, 4, 12, 0),
    (27, 6, 6, 6, 6, 6, 5, 0), 
    (36, 0, 8, 8, 8, 8, 8, 0),
    (12, 6, 6, 6, 6, 6, 5, 0),
    (29, 0, 12, 6, 10, 6, 8, 0),
    (32, 7, 4, 9, 0, 0, 10, 3),
    (6, 6, 6, 6, 6, 6, 5, 0),
    (20, 0, 12, 6, 10, 6, 8, 0),
    (14, 12, 0, 12, 0, 4, 12, 0),
    (21, 8, 8, 0, 0, 8, 10, 6),
    (16, 10, 8, 0, 0, 8, 10, 10), 
    (34, 0, 8, 8, 8, 8, 8, 0),
    (9, 10, 8, 0, 0, 8, 10, 10),
    (39, 10, 8, 0, 0, 8, 10, 10),
    (30, 8, 8, 0, 0, 8, 10, 6),
    (38, 12, 0, 12, 0, 4, 12, 0),
    (37, 0, 12, 6, 10, 6, 8, 0),
    (7, 0, 12, 6, 10, 6, 8, 0),
    (1, 7, 4, 9, 0, 0, 10, 3),
    (40, 0, 12, 6, 10, 6, 8, 0),
    (15, 8, 8, 0, 0, 8, 10, 6),
    (2, 8, 8, 0, 0, 8, 10, 6),
    (31, 6, 6, 6, 6, 6, 5, 0),
    (11, 12, 0, 12, 0, 4, 12, 0),
    (24, 12, 0, 12, 0, 4, 12, 0),
    (35, 10, 8, 0, 0, 8, 10, 10),
    (28, 0, 8, 8, 8, 8, 8, 0),
    (8, 7, 4, 9, 0, 0, 10, 3),
    (17, 6, 6, 6, 6, 6, 5, 0),
    (18, 10, 8, 0, 0, 8, 10, 10),
    (23, 0, 8, 8, 8, 8, 8, 0),
    (3, 7, 4, 9, 0, 0, 10, 3),
    (4, 6, 6, 6, 6, 6, 5, 0),
    (10, 0, 12, 6, 10, 6, 8, 0),
    (26, 0, 8, 8, 8, 8, 8, 0),
    (22, 0, 8, 8, 8, 8, 8, 0),
    (33, 10, 8, 0, 0, 8, 10, 10),
    (5, 8, 8, 0, 0, 8, 10, 6),
    (19, 0, 8, 8, 8, 8, 8, 0)
;


SELECT
    pet.name AS "Pet Name",
    petType.description AS "Pet Type",
    breed.description AS "Breed",
    CONCAT(client.firstName, ' ', client.lastName) AS "Owner",
    client.phone AS "Phone Number",
    client.email AS "Email"
FROM
    clientPet
JOIN 
    pet ON clientPet.petId = pet.id
JOIN 
    client ON clientPet.clientId = client.id
JOIN 
    petType ON pet.petTypeId = petType.id
JOIN 
    breed ON pet.breedId = breed.id
ORDER BY
    client.lastName,
    client.firstName,
    pet.name;
    


SELECT
    CONCAT(employee.firstName, ' ', employee.lastName) AS "Employee",
    position.description AS "Position",
    timecard.sun + timecard.mon + timecard.tues + timecard.wed + timecard.thurs + timecard.fri + timecard.sat AS "Hours"
FROM
    employeePosition
JOIN 
    employee ON employeePosition.employeeId = employee.id
JOIN 
    position ON employeePosition.positionId = position.id
JOIN 
    timecard ON employee.id = timecard.employeeId
ORDER BY
    employee.lastName;
    
    

    

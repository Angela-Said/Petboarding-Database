USE petboarding 

CREATE TABLE workschedule(
    ID              INT         NOT NULL   AUTO_INCREMENT,
    employeeId      INT         NOT NULL,
    startDateTime   TIMESTAMP   NOT NULL,
    endDateTime     TIMESTAMP   NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(employeeId) REFERENCES employee(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO workschedule (employeeId, startDateTime, endDateTime) VALUES
    (1, '2024-04-01 08:00:00', '2024-04-01 16:00:00'),
    (3, '2024-04-01 09:00:00', '2024-04-01 17:00:00'),
    (4, '2024-04-01 12:00:00', '2024-04-01 21:00:00'),
    (2, '2024-04-01 16:00:00', '2024-04-01 23:00:00'),
    (19, '2024-04-02 07:00:00', '2024-04-02 14:00:00'),
    (21, '2024-04-02 07:00:00', '2024-04-02 16:00:00'),
    (12, '2024-04-02 07:00:00', '2024-04-02 15:00:00'),
    (20, '2024-04-02 09:00:00', '2024-04-02 17:00:00'),
    (11, '2024-04-03 06:00:00', '2024-04-03 14:00:00'),
    (18, '2024-04-03 07:00:00', '2024-04-03 15:00:00'),
    (23, '2024-04-03 08:00:00', '2024-04-03 16:00:00'),
    (22, '2024-04-03 09:00:00', '2024-04-03 17:00:00'),
    (10, '2024-04-04 06:00:00', '2024-04-04 14:00:00'),
    (25, '2024-04-04 07:00:00', '2024-04-04 16:00:00'),
    (24, '2024-04-04 08:00:00', '2024-04-04 17:00:00'),
    (17, '2024-04-04 09:00:00', '2024-04-04 18:00:00'),
    (27, '2024-04-05 07:00:00', '2024-04-05 16:00:00'),
    (9, '2024-04-05 08:00:00', '2024-04-05 17:00:00'),
    (26, '2024-04-05 09:00:00', '2024-04-05 17:00:00'),
    (28, '2024-04-05 10:00:00', '2024-04-06 18:00:00'),
    (29, '2024-04-06 07:00:00', '2024-04-06 16:00:00'),
    (15, '2024-04-06 08:00:00', '2024-04-06 17:00:00'),
    (16, '2024-04-06 09:00:00', '2024-04-06 18:00:00'),
    (33, '2024-04-07 07:00:00', '2024-04-07 14:00:00'),
    (31, '2024-04-07 07:00:00', '2024-04-07 15:00:00'),
    (32, '2024-04-07 08:00:00', '2024-04-07 17:00:00'),
    (30, '2024-04-07 09:00:00', '2024-04-07 17:00:00'),
    (13, '2024-04-09 07:00:00', '2024-04-09 15:00:00'),
    (35, '2024-04-09 08:00:00', '2024-04-09 16:00:00'),
    (34, '2024-04-09 09:00:00', '2024-04-09 17:00:00'),
    (14, '2024-04-09 10:00:00', '2024-04-09 19:00:00'),
    (8, '2024-04-09 12:00:00', '2024-04-09 20:00:00'),
    (37, '2024-04-10 07:00:00', '2024-04-10 15:00:00'),
    (38, '2024-04-10 08:00:00', '2024-04-10 16:00:00'),
    (39, '2024-04-10 09:00:00', '2024-04-10 17:00:00'),
    (40, '2024-04-10 10:00:00', '2024-04-10 18:00:00'),
    (36, '2024-04-10 13:00:00', '2024-04-10 22:00:00'),
    (5, '2024-04-11 07:00:00', '2024-04-11 16:00:00'),
    (6, '2024-04-11 08:00:00', '2024-04-11 17:00:00'),
    (7, '2024-04-11 09:00:00', '2024-04-11 18:00:00')
;


CREATE VIEW workscheduleview AS
SELECT CONCAT(e.firstName, ' ', e.lastName) AS "Employee",
       p.description AS "Position",
       ws.startDateTime AS "Start",
       ws.endDateTime AS "End"
FROM workschedule ws
JOIN 
    employee e ON ws.employeeId = e.id
JOIN 
    employeeposition ep ON e.id = ep.employeeId
JOIN 
    position p ON ep.positionId = p.id
ORDER BY ws.startDateTime;


ALTER TABLE pet MODIFY COLUMN weight DECIMAL(5,1);


UPDATE pet
       SET weight = weight + 50
     WHERE name = 'Buddy';
UPDATE pet
       SET weight = weight + 20
     WHERE name = 'Charlie';
UPDATE pet
       SET weight = weight + 15
     WHERE name = 'Luna';
UPDATE pet
       SET weight = weight + 30
     WHERE name = 'Cooper';
UPDATE pet
       SET weight = weight + 50
     WHERE name = 'Jack';
UPDATE pet
       SET weight = weight + 120
     WHERE name = 'Chloe';
UPDATE pet
       SET weight = weight + 30
     WHERE name = 'Buster';
UPDATE pet
       SET weight = weight + 30
     WHERE name = 'Sophie';
UPDATE pet
       SET weight = weight + 10
     WHERE name = 'Lily';
UPDATE pet
       SET weight = weight + 70
     WHERE name = 'Oreo';
UPDATE pet
       SET weight = weight + 100
     WHERE name = 'Ginger';
UPDATE pet
       SET weight = weight + 10
     WHERE name = 'Rusty';
UPDATE pet
       SET weight = weight - 6
     WHERE name = 'Zeus';
UPDATE pet
       SET weight = weight + 80
     WHERE name = 'Sasha';
UPDATE pet
       SET weight = weight + 85
     WHERE name = 'Sammy';
UPDATE pet
       SET weight = weight - 10
     WHERE name = 'Annie';
UPDATE pet
       SET weight = weight + 40
     WHERE name = 'Tucker';




SELECT p.name AS "Pet Name",
       pt.description AS "Pet Type",
       b.description AS "Breed",
       p.weight AS "Weight"
FROM pet p
JOIN 
    breed b ON p.breedId = b.id
JOIN 
    pettype pt ON p.petTypeId = pt.id
ORDER BY p.name;

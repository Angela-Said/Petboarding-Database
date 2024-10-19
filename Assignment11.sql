USE petboarding

CREATE TABLE employeedeposit(
    ID         INT      NOT NULL AUTO_INCREMENT,
    employeeID INT      NOT NULL,
    payDeposit DEC(6,2) NOT NULL DEFAULT 0.0,
    PRIMARY KEY(ID),
    FOREIGN KEY(employeeId) REFERENCES employee(ID) ON UPDATE CASCADE ON DELETE CASCADE
);



DELIMITER $$
DROP FUNCTION IF EXISTS depositAmount$$
CREATE FUNCTION depositAmount(hours INT, rate DECIMAL(6,2))
RETURNS DECIMAL(6,2) 
DETERMINISTIC 
BEGIN
DECLARE deposit DECIMAL(6,2);
DECLARE overtime INT;

IF hours <= 40 THEN
    SET deposit = hours * rate;
ELSE
    SET overtime = (hours - 40) * (rate * 1.5);
    SET deposit = 40 * rate;
    SET deposit = deposit + overtime;
END IF;
RETURN deposit;
END $$
DELIMITER ;





DELIMITER $$
DROP TRIGGER IF EXISTS after_timecard_insert $$
CREATE TRIGGER after_timecard_insert
AFTER INSERT ON timecard
FOR EACH ROW BEGIN

DECLARE v_empId INT DEFAULT 0;
DECLARE v_rate DEC(5,2) DEFAULT 0.0;
DECLARE v_hours INT DEFAULT 0;
DECLARE v_deposit DEC(6,2) DEFAULT 0.0;
    
    
    SELECT e.id, p.hourly, (t.sun + t.mon + t.tues + t.wed + t.thurs + t.fri + t.sat)
      INTO v_empId, v_rate, v_hours  
      FROM employee e, employeeposition ep, position p, timecard t 
     WHERE e.id = ep.employeeId
       AND p.id = ep.positionId
       AND e.id = t.employeeId
       AND t.employeeId = NEW.employeeId;
       
SET v_deposit = depositAMount(v_hours, v_rate);

INSERT INTO employeedeposit(employeeID, payDeposit) VALUES (v_empID, v_deposit);

END$$
DELIMITER ;


DELETE FROM timecard;

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
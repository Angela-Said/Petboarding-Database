USE petboarding

/* 
Create a table named ratetype with the following attributes, data types, and constraints:
a. ID, integer, not null, auto increment
b. description, varying character, size 30, not null
c. rate, decimal, size (5, 2), not null
d. primary key is the ID field 
*/

CREATE TABLE ratetype(
    ID           INT           NOT NULL AUTO_INCREMENT,
    description  VARCHAR(30)   NOT NULL,
    rate         DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY(ID)
);


/*
    Write the INSERT query to insert data in file ratetype.sql into table ratetype
*/

INSERT INTO ratetype (description, rate) VALUES
    
('Standard', '25.00'),
('Deluxe', '35.00'),
('Condo', '45.00'),
('Private', '55.00')
;


/*
    Create a table named board with the following attributes, data types, and constraints:
a. ID, integer, not null, auto increment
b. petId, integer, not null
c. ratetypeId, integer, not null
d. days, integer, not null, default value 0
e. primary key is the ID field
f. foreign key on field petId, references table pet, column id, on update cascade and
on delete cascade
g. foreign key on field ratetypeId, references table ratetype, column id, on update
cascade and on delete cascade

*/

CREATE TABLE board(
    ID          INT NOT NULL AUTO_INCREMENT,
    petID       INT NOT NULL,
    raTetypeID  INT NOT NULL,
    days        INT NOT NULL DEFAULT 0,
    PRIMARY KEY(ID),
    FOREIGN KEY(petID) REFERENCES pet(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(ratetypeID) REFERENCES ratetype(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


/*
Write the INSERT query to insert data in file board.sql into table board
*/

INSERT INTO board(petId, ratetypeId, days) VALUES
    
    (500, 1, 3),
    (505, 2, 4),
    (510, 3, 2),
    (515, 4, 5),
    (520, 1, 3),
    (525, 2, 4),
    (530, 3, 6),
    (535, 4, 9),
    (540, 1, 2),
    (545, 2, 1)
;


DELIMITER $$
DROP PROCEDURE IF EXISTS boardBill$$ 
CREATE PROCEDURE boardBill(INOUT bill VARCHAR(4000))
BEGIN
    DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE v_lines VARCHAR(100) DEFAULT ' ----------------------------------------------
    ---------------------------------- '; 
    DECLARE v_count INTEGER DEFAULT 0;
    DECLARE v_clientFirst VARCHAR(100) DEFAULT "";
    DECLARE v_clientLast VARCHAR(100) DEFAULT "";
    DECLARE v_clientAddress VARCHAR(100) DEFAULT "";
    DECLARE v_clientCity VARCHAR(100) DEFAULT "";
    DECLARE v_clientState VARCHAR(100) DEFAULT "";
    DECLARE v_clientZip VARCHAR(100) DEFAULT "";
    DECLARE v_pet VARCHAR(100) DEFAULT "";
    DECLARE v_rate DECIMAL(5,2) DEFAULT 0.0;
    DECLARE v_days INTEGER DEFAULT 0;
    DECLARE v_bill DECIMAL(8,2) DEFAULT 0.0;

    DECLARE board_cursor CURSOR FOR

    SELECT c.firstName,
           c.lastName,
           c.address,
           cs.city,
           cs.state,
           cs.zipCode,
           p.name,
           r.rate,
           b.days
      FROM client c, citystatezip cs, pet p, board b, ratetype r, clientpet cp 
     WHERE c.zipCode = cs.zipCode
       AND cp.clientId = c.id
       AND cp.petId = p.id
       AND b.petId = p.id
       AND b.ratetypeId = r.id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

    OPEN board_cursor;

    get_board: LOOP
        FETCH board_cursor INTO v_clientFirst,
                                v_clientLast,
                                v_clientAddress,
                                v_clientCity,
                                v_clientState,
                                v_clientZip,
                                v_pet,
                                v_rate,
                                v_days;

        IF v_finished = 1 THEN LEAVE get_board; END IF;

        SET v_count = v_count + 1;

        IF v_count >= 1 THEN 
            SET v_bill = v_rate * v_days;
            SELECT v_bill;
            SET bill = CONCAT(bill, '\n', v_lines, '\n');
            SET bill = CONCAT(bill, '\n CGS 2545 Pet Boarding\n');
            SET bill = CONCAT(bill, 'UCF\n');
            SET bill = CONCAT(bill, 'NSC 101\n\n');
            SET bill = CONCAT(bill, v_clientFirst, '', v_clientLast, '\n');
            SET bill = CONCAT(bill, v_clientAddress, '\n');
            SET bill = CONCAT(bill, v_clientCity, ', ', v_clientState, ' ', v_clientZip, '\n\n');
            SET bill = CONCAT(bill, 'Pet name: ', v_pet, '\n');
            SET bill = CONCAT(bill, 'Rate: $', v_rate, ' per day\n');
            SET bill = CONCAT(bill, 'Days: ', v_days, '\n');
            SET bill = CONCAT(bill, 'Total: $', v_bill, '\n');
            SET bill = CONCAT(bill, '\n', v_lines, '\n');
        END IF;
    END LOOP get_board;

    CLOSE board_cursor;
END$$

DELIMITER ;

    

SET  @bill = "";
CALL boardBill(@bill);
SELECT @bill;







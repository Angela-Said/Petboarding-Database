USE petboarding

CREATE TABLE breed(
    ID           INT         NOT NULL  AUTO_INCREMENT,
    description  VARCHAR(30) NOT NULL  UNIQUE,
    PRIMARY KEY(ID)
    );

ALTER TABLE breed AUTO_INCREMENT = 200;

CREATE TABLE pet(
    ID        INT           NOT NULL AUTO_INCREMENT,
    breedId   INT           NOT NULL,
    petTypeId INT           NOT NULL,
    name      VARCHAR(25)   NOT NULL,
    age       INT           NOT NULL,
    weight    DECIMAL(3, 1),
    color     VARCHAR(25)   NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(breedId) REFERENCES breed (ID),
    FOREIGN KEY(petTypeId) REFERENCES petType (ID)
    );
    
ALTER TABLE pet AUTO_INCREMENT = 500;

CREATE TABLE clientPet(
    clientId INT NOT NULL,
    petId    INT NOT NULL,
    PRIMARY KEY(clientId, petId),
    FOREIGN KEY(clientId) REFERENCES client (ID),
    FOREIGN KEY(petId) REFERENCES pet (ID)
    );
    
INSERT INTO employee(firstName, lastName, address, city, state, zipCode, phone, email) VALUES

('Raheem','Montgomery','71 Paris Hill Rd.','32703','4134849795','rmontgomery@isp.com'),  
('Leo','Bird','201 Eagle Dr.','32709','7747829407','lbird@isp.com'),
('Oliwier','Barnett','81 Cedar Swamp St.','32703','2764343958','obarnett@isp.com'),
('Fern','Garner','37 Gartner Court','32709','2256254378','fgarner@isp.com'),
('Dawson','Marquez','90 Mammoth Street','32751','7634882879','dmarquez@isp.com'),
('Raja','Glass','7918 Talbot Ave.','32751','2319969540','rglass@isp.com'),
('Alissa','Ortiz','7756 Fulton Court','32839','2397268929','aortiz@isp.com'),
('Nicholas','Pena','8123 Race Ave.','33458','7815242242','npena@isp.com'),
('Harvey','West','9 Cherry Ave','32839','7326232762','hwest@isp.com'),
('Aamina','Dillon','9 West Boston Lane','33458','2035745299','adillon@isp.com'),
('Louis','Giles','598 North Road','34786','2708583758','lgiles@isp.com'),
('Krystal','Walters','583 North Nichols Street','33458','3232591832','kwalters@isp.com'),
('Alexa','Preston','9227 North Bow Ridge Street','34786','4098496634','apreston@isp.com'),
('Rebekah','Morgan','9437 East 6th Street','32810','6073928343','rmorgan@isp.com'),
('Ethan','Ali','167 NE. Depot Dr.','34786','2245499884','eali@isp.com'),
('Malik','Vincent','312 Colonial Ave.','34787','9149573014','mvincent@isp.com'),
('Sara','Barron','9064 E. Swanson St.','32810','8707743244','sbarron@isp.com'),
('Lyra','Murphy','400 Nut Swamp Drive','34787','3527673126','lmurphy@isp.com'),
('Awais','Carrillo','225 South Manhattan Street','32790','6369577670','acarrillo@isp.com'),
('Kaya','Hodge','9572 William Lane','32709','2125271561','khodge@isp.com'),
('Jemima','Miller','9290 Indian Spring Rd.','32790','6206673264','jmiller@isp.com'),
('Laila','Christensen','15 Rose Avenue','32812','9017396978','lchristensen@isp.com'),
('Honey','Warren','7946 Leeton Ridge Street','32777','5858531050','hwarren@isp.com'),
('Brodie','Gordon','71 Jackson Ave.','32709','9016899813','bgordon@isp.com'),
('Lauren','Morton','7931 Rockaway Street','32790','4476721422','lmorton@isp.com'),
('Ty','Bell','921 Brook St.','32812','2393336881','tbell@isp.com'),
('Floyd','Johns','2 Shore Street','32777','4065842872','fjohns@isp.com'),
('Mathew','Horton','1 Rockland Ave.','32709','7195789907','mhorton@isp.com'),
('Ernest','Higgins','451 Marshall Lane','32777','7637651247','ehiggins@isp.com'),
('Kamil','Lozano','75 N. Golden Star Street','32812','7638554744','klozano@isp.com')
;

INSERT INTO employeePosition VALUES 

    (20,8),
    (23,3),
    (17,6),
    (29,4),
    (34,5),
    (15,5),
    (39,2), 
    (25,10),
    (14,2),  
    (37,3),
    (19,8),
    (33,8),
    (31,10), 
    (40,7),
    (30,3),
    (22,10),
    (32,5),
    (35,6),
    (12,1),   
    (21,6),
    (28,2),
    (26,6),
    (38,5), 
    (18,8),
    (13,4),
    (11,9),
    (16,10),
    (24,9),
    (27,1),
    (36,7)
;

INSERT INTO breed (description) VALUES

('French Bulldog'),
('Labrador Retriever'),
('Golden Retriever'),
('German Shepherd'),
('Poodle'),
('Bulldog'),
('Rottweiler'),
('Beagle'),
('Dachshund'),
('German Shorthaired Pointer'),
('Pembroke Welsh Corgi'),
('Australian Shepherd'),
('Yorkshire Terrier'),
('Cavalier King Charles Spaniel'),
('Doberman Pinscher'),
('Boxer'),
('Miniature Schnauzer'),
('Cane Corso'),
('Great Dane'),
('Shih Tzu'),
('Siberian Husky'),
('Pomeranian'),
('Boston Terrier'),
('Havanes'),
('English Springer Spaniel'),
('Shetland Sheepdog'),
('Cocker Spaniel'),
('Border Collie'),
('Domestic Shorthair'), 
('Domestic Longhair'), 
('Abyssinian'),
('Bengal'),
('Bombay'),
('Burmese'),
('Cornish Rex'),
('Devon Rex'),
('Himalayanz'),
('Maine Coonz'),
('Manx'),
('Persian'),
('Ragdoll'),
('Russian Blue'),
('Scottish Fold'),
('Siamese'),
('Sphynx'),
('Turkish Angora'),
('Turkish Van'),
('Unknown')
 ;
 
SELECT 
  CONCAT(e.firstName, e.lastName) AS "Employee Name",
  e.phone AS "Employee Phone",
  e.email AS "Employee Email",
  p.description AS "Employee Position"
FROM 
  employee AS e
JOIN 
  employeePosition AS ep ON e.id = ep.employeeId
JOIN 
  position AS p ON ep.positionId = p.id
ORDER BY 
  e.lastName;


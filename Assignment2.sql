CREATE DATABASE petboarding;

USE petboarding;

CREATE TABLE employee(
	ID INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    address VARCHAR(90) NOT NULL,
    city VARCHAR(25) NOT NULL,
    state CHAR(2) NOT NULL,
    zipCode CHAR(5) NOT NULL,
    phone CHAR(10) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE client(
	ID INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    address VARCHAR(90) NOT NULL,
    city VARCHAR(25) NOT NULL,
    state CHAR(2) NOT NULL,
    zipCode CHAR(5) NOT NULL,
    phone CHAR(10) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE position(
	ID INT NOT NULL AUTO_INCREMENT,
    description VARCHAR(30) NOT NULL UNIQUE,
    hourly DECIMAL(5,2) NOT NULL DEFAULT(15.00),
    PRIMARY KEY(ID)
);

CREATE TABLE pettype(
	ID INT NOT NULL AUTO_INCREMENT,
    description VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

INSERT INTO client(firstname, lastname, address, city, state, zipCode, phone, email) VALUES

('Meera','White','484 Bridge St','Winter Garden','FL','34787','2025550166','mwhite@isp.com'),
('Bradlee','Esparza','7031 Gainsway St','Winter Garden','FL','34787','2025550173','besparza@isp.com'),
('Leilani','Leonard','37 Monroe Street','Winter Garden','FL','34787','2025550175','lleonard@isp.com'),
('Stefanie','Brook','7990 West Surrey St','Winter Garden','FL','34787','2025550179','sbrook@isp.com'),
('Grover','Squires','7618 Madison Court','Winter Garden','FL','34787','2025550180','gsquires@isp.com'),
('Efe','House','97 High Point Street','Pine Castle','FL','32839','2025550196','ehouse@isp.com'),
('Atticus','Atkinson','66 Harrison Dr','Pine Castle','FL','32839','2025550197','aatkinson@isp.com'),
('Michelle','Ramirez','370 Hill Field Ave','Pine Castle','FL','32839','2025550198','mramirez@isp.com'),
('Remy','Hassan','249 Devon Lane','Pine Castle','FL','32839','2225550199','rhassan@isp.com'),
('Jordana','Beck','7911 Carson Lane','Pine Castle','FL','32839','2025550200','jbeck@isp.com'),
('Igor','Prince','12 Creekside St','Tangerine','FL','32777','2025550199','iprince@isp.com'),
('Avaya','Clarke','7771 Border Court','Tangerine','FL','32777','2225550119','aclarke@isp.com'),
('Douglas','Guthrie','9 Wrangler Ave','Tangerine','FL','32777','2225550124','dguthrie@isp.com'),
('Yvonne','Goodman','12 Creekside St','Winter Park','FL','32790','2025550109','ygoodman@isp.com'),
('Dante','Mackenzie','137 Wall St','Winter Park','FL','32790','2025550112','dmackenzie@isp.com'),
('Alysha','Rollins','411 Shirley St','Winter Park','FL','32790','2025550115','arollins@isp.com'),
('Avaya','Gonzalez','7771 Border Court','Winter Park','FL','32790','2025550119','agonzalez@isp.com'),
('Haniya','Kelly','6 South Sulphur Springs Street','Winter Park','FL','32790','2025550121','hkelly@isp.com'),
('Jonathan','Kumar','25 Annadale Court','Jupiter','FL','33458','2025550182','jkumar@isp.com'),
('Angus','Neville','9841 Smith Drive','Jupiter','FL','33458','2025550187','aneville@isp.com'),
('Uzair','Sparrow','7999 Hall Street','Jupiter','FL','33458','2025550188','usparrow@isp.com'),
('Amari','Currie','8411 Pleasant St','Jupiter','FL','33458','2025550194','acurrie@isp.com'),
('Imaani','Wallace','33 Pierce Rd','Jupiter','FL','33458','2025550195','iwallace@isp.com'),
('Nathalie','Chambers','942 New Saddle Drive','Windermere','FL','34786','2025550122','nchambers@isp.com'),
('Dante','Rollins','9 Wrangler Ave','Windermere','FL','34786','2025550124','drollins@isp.com'),
('Beverley','Mckee','7319 S. Greenview Drive','Windermere','FL','34786','2025550125','bmckee@isp.com'),
('Thomas','Waters','411 Shirley St','Lockhart','FL','32810','2225550115','twaters@isp.com'),
('Haniya','Kaiser','6 South Sulphur Springs Street','Belle Isle','FL','32812','2225550121','hkaiser@isp.com'),
('Victor','Newman','942 New Saddle Drive','Belle Isle','FL','32812','2225550122','vnewman@isp.com'),
('Brian','Roberts','7319 S. Greenview Drive','Sand Lake','FL','32819','2225550125','broberts@isp.com'),
('Paris','Solis','763 West Mulberry St','Sand Lake','FL','32819','2025550132','psolis@isp.com'),
('Umaiza','Heath','545 Ohio Ave','Sand Lake','FL','32819','2025550135','uheath@isp.com'),
('Dante','Rennie','137 Wall St','Sand Lake','FL','32819','2225550112','drennie@isp.com'),
('Robin','Solis','8474 Wentworth Street','Sand Lake','FL','32819','2025550164','rsolis@isp.com'),
('Kavita','Heath','796 Hartford St','Sand Lake','FL','32819','2025550165','kheath@isp.com')
;

INSERT INTO employee(firstName, lastName, address, city, state, zipCode, phone, email) VALUES

('Paris','Lindsey','763 West Mulberry St','Apopka','FL','32703','2025550132','plindsey@isp.com'),
('Umaiza','Melia','545 Ohio Ave','Apopka','FL','32703','2025550135','umelia@isp.com'),
('Nico','Prince','20 Middle River Street','Christmas','FL','32709','2025550137','nprince@isp.com'),
('Javan','Rennie','8112 North Country St','Christmas','FL','32709','2025550139','jrennie@isp.com'),
('Ali','Waters','83 Rockland Lane','Christmas','FL','32709','2025550144','awaters@isp.com'),
('JohnPaul','Clarke','1 Riverside Lane','Christmas','FL','32709','2025550153','jpcClarke@isp.com'),
('Dane','Kaiser','694 Wall Road','Christmas','FL','32709','2025550155','kdaiser@isp.com'),
('Hammad','Newman','9970 State Court','Eatonville','FL','32751','2025550157','hnewman@isp.com'),
('Maha','Guthrie','54 Woodsman Drive','Eatonville','FL','32751','2025550161','mguthrie@isp.com'),
('Tulisa','Roberts','7174 Studebaker Street','Eatonville','FL','32751','2025550163','troberts@isp.com')
;

INSERT INTO position(description, hourly) VALUES

('Manager','60.00'),
('Animal Trainer','50.00'),
('Groom','25.00'),
('Receptionist','20.00'),
('Bather','13.00'),
('Kennel Technician','17.50'),
('Veterinarian','85.00'),
('Pet Exerciser','15.00'),
('Maintenance','32.00'),
('Groomer','18.00')
;

INSERT INTO pettype(description) VALUES

('Cat'),
('Dog'),
('Horse'),
('Bird'),
('Reptile'),
('Rabbit'),
('Guinea pig'),
('Fish'),
('Ferret'),
('Rat'),
('Mouse'),
('Amphibian'),
('Hamster'),
('Snake'),
('Turtle')
;
USE petboarding 

INSERT INTO pet( breedId, petTypeId, name, age, weight, color) VALUES
    (201, 2, 'Buddy', 3, 10.5, 'Brown'),
    (202, 2, 'Max', 5, 15.2, 'Black'),
    (228, 1, 'Lucy', 3, 8.7, 'White'),
    (204, 2, 'Bailey', 4, 12.3, 'Golden'),
    (205, 2, 'Charlie', 6, 18.6, 'Brown'),
    (230, 1, 'Molly', 3, 6.4, 'Black'),
    (231, 1, 'Daisy', 3, 9.9, 'White'),
    (208, 2, 'Rocky', 7, 20.1, 'Golden'),
    (233, 1, 'Sadie', 3, 7.2, 'Brown'),
    (210, 2, 'Luna', 5, 11.8, 'Black'),
    (211, 2, 'Cooper', 4, 14.5, 'White'),
    (235, 1, 'Bella' , 3, 8.3, 'Golden'),
    (213, 2, 'Toby' , 6, 16.2, 'Brown'),
    (236, 1, 'Lola', 3, 9.1, 'Black'),
    (215, 2, 'Jack', 4, 12.7, 'White'),
    (216, 2, 'Maggie', 7, 19.4, 'Golden'),
    (238, 1, 'Duke', 3, 5.8, 'Brown'),
    (218, 2, 'Chloe', 5, 13.9, 'Black'),
    (239, 1, 'Bear', 3, 9.5, 'White'),
    (220, 2, 'Buster', 4, 15.3, 'Golden'),
    (221, 2, 'Zoe', 6, 17.8, 'Brown'),
    (240, 1, 'Riley', 3, 7.1, 'Black'),
    (223, 2, 'Bailey', 5, 12.6, 'White'),
    (224, 2, 'Sophie', 3, 10.2, 'Golden'),
    (225, 2, 'Lily', 4, 14.7, 'Brown'),
    (226, 2, 'Shadow', 7, 18.9, 'Black'),
    (241, 1, 'Max', 3, 6.5, 'White'),
    (228, 2, 'Coco', 6, 16.3, 'Golden'),
    (229, 1, 'Milo', 3, 8.9, 'Brown'),
    (200, 2, 'Rosie', 4, 13.5, 'Black'),
    (203, 2, 'Oreo', 5, 11.1, 'White'),
    (232, 1, 'Sam', 3, 7.8, 'Golden'),
    (206, 2, 'Ginger', 7, 19.6, 'Brown'),
    (234, 1, 'Penny', 3, 9.3, 'Black'),
    (207, 2, 'Rusty', 4, 14.2, 'White'),
    (209, 2, 'Jake', 6, 17.7, 'Golden'),
    (237, 1, 'Holly', 3, 6.9, 'Brown'),
    (212, 2, 'Zeus', 5, 12.5, 'Black'),
    (214, 2, 'Sasha', 3, 10.8, 'White'),
    (217, 2, 'Sammy', 4, 14.4, 'Golden'),
    (219, 2, 'Annie', 7, 19.1, 'Brown'),
    (242, 1, 'Ruby', 3, 9.7, 'Black'),
    (222, 2, 'Milo' , 6, 16.8, 'White'),
    (244, 1, 'Leo', 3, 5.5, 'Golden'),
    (227, 2, 'Princess', 5, 11.9, 'Brown'),
    (246, 1, 'Cody', 3, 9.2, 'Black'),
    (220, 2, 'Tucker', 4, 14.8, 'White'),
    (210, 2, 'Emma', 7, 18.3, 'Golden'),
    (246, 1, 'Lady', 3, 7.6, 'Brown'),
    (200, 2, 'Sandy', 5, 13.4, 'Black')
;

INSERT INTO clientPet VALUES
    (7,  519),
    (7,  539),
    (10, 509),
    (10, 537),
    (4,  521),
    (24, 540),
    (24, 500),
    (12, 547),
    (12, 507),
    (22, 523),
    (2,  536),
    (2,  520),
    (17, 503),
    (17, 528),
    (14, 529),
    (13, 512),
    (9,  530),
    (35, 515),
    (32, 514),
    (32, 548),
    (32, 538),
    (6,  518),
    (28, 534),
    (18, 528),
    (19, 506),
    (19, 546),
    (3,  531),
    (15, 501),
    (15, 541),
    (26, 514),
    (26, 524),
    (26, 544),
    (20, 532),
    (29, 549),
    (29, 525),
    (11, 517),
    (8,  502),
    (33, 511),
    (30, 545),
    (30, 505),
    (16, 516),
    (25, 543),
    (25, 533),
    (31, 501),
    (34, 504),
    (21, 527),
    (5,  508),
    (23, 513),
    (27, 510),
    (1,  503)
;


SELECT
    p.name AS "Name",
    pt.description AS "Pet Type",
    b.description AS "Breed"
FROM 
    pet AS p
JOIN 
    breed b ON p.breedId = b.Id
JOIN 
    petType pt ON p.petTypeId = pt.Id
WHERE
    pt.description = 'Dog'
ORDER BY
    p.name;


    
SELECT 
    p.name AS "Name",
    pt.description AS "Pet Type",
    b.description AS "Breed"
FROM
    pet AS p
JOIN 
    breed b ON p.breedId = b.Id
JOIN
    petType pt ON p.petTypeId = pt.Id
WHERE
    pt.description = 'Cat'
ORDER BY
    p.name;
    


SELECT 
    p.name AS "Pet Name",
    pt.description AS "Pet Type",
    CONCAT(c.firstName, c.lastName) AS "Owner",
    c.phone AS "Phone Number",
    c.email AS "Email"
FROM
    clientPet AS cp
JOIN 
    pet p on cp.petId = p.Id
JOIN
    client c ON cp.clientId = c.Id
JOIN
    petType pt ON p.petTypeId = pt.Id
ORDER BY
    c.lastName, c.firstName, p.name;


    
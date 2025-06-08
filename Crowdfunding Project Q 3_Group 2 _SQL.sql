use projectq3;
ALTER TABLE projects
ADD CONSTRAINT pk_projectID PRIMARY KEY (projectID);

ALTER TABLE category
ADD CONSTRAINT pk_categoryID PRIMARY KEY (ID);

ALTER TABLE location
ADD CONSTRAINT pk_locationID PRIMARY KEY (ID);

ALTER TABLE creator
ADD CONSTRAINT pk_creatorID PRIMARY KEY (ID);


SELECT DISTINCT categoryID
FROM projects
WHERE categoryID NOT IN (SELECT categoryID FROM categories);

SELECT DISTINCT location_id
FROM projects
WHERE location_id NOT IN (SELECT ID FROM locations);


SELECT DISTINCT creatorID
FROM projects
WHERE creatorID NOT IN (SELECT creatorID FROM creators);

UPDATE projects
SET category_ID = (SELECT ID FROM category LIMIT 1) 
WHERE category_ID NOT IN (SELECT ID FROM category);

UPDATE projects
SET location_id = (SELECT ID FROM location LIMIT 1) 
WHERE location_id NOT IN (SELECT ID FROM location);

UPDATE projects
SET creator_ID = (SELECT ID FROM creator LIMIT 1) 
WHERE creator_ID NOT IN (SELECT ID FROM creator);

ALTER TABLE projects
ADD CONSTRAINT fk_category
FOREIGN KEY (categoryID) REFERENCES category(ID);

ALTER TABLE projects
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id) REFERENCES location(ID);

ALTER TABLE projects
ADD CONSTRAINT fk_creator
FOREIGN KEY (creator_ID) REFERENCES creator(ID);
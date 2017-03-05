select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('5', 	   'Kill the REAL bugs!', 'Continuing to work on database design.');

SELECT EpisodeID, EpisodeName, Description from episode order by episodeid desc limit 1;	         


REPLACE INTO todoliststate (ListID) VALUES(5),(6);
										  
SELECT listID, title, EpisodeID, description
  from todolist 
  JOIN todoliststate USING (listid)
  JOIN todostate USING (stateID)
  JOIN episode USING (EpisodeID)
  WHERE stateID = 0
    AND listID not in (SELECT listid 
    	                 from todolist 
    	                 join todoliststate using (listid) 
    	                where stateID IN (1,2))
  order by listID desc;


drop table if exists outputTarget;
drop table if exists craftingMachine;
drop table if exists recipe;
drop table if exists recipeComponent;

CREATE TABLE outputTarget (
	targetName TEXT PRIMARY KEY,
	targetAmount REAL
);


CREATE TABLE craftingMachine (
	CraftingName TEXT PRIMARY KEY,
	electricConsumption REAL,
	drain REAL,
	craftingSpeed REAL

);

CREATE TABLE recipe(
	item	TEXT PRIMARY KEY,
	amount 	REAL,
	craftingSpeed REAL
);



CREATE TABLE recipeComponent(
	item 	TEXT REFERENCES recipe,
	constituentItem	REFERENCES recipe (item),
	constituentItemAmount REAL,
	PRIMARY KEY (item, constituentItem)
);

INSERT INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
 	 VALUES 			    ('Assembling machine 1', '100', '3.3', '0.5');

INSERT INTO outputTarget(targetName, 			targetAmount) 
	 VALUES 		    ('1 per Second', 		1),
						('Yellow Belt 1 side', 	40/3);

INSERT INTO recipe (item, 				amount, craftingSpeed) 
  	 VALUES 	   ('Science pack 1', 	1,		5),
  	 			   ('Iron gear wheel',	1,		0.5),
  	 			   ('Iron plate',		2,		7),
  	 			   ('Copper plate',		2,		7);

INSERT INTO recipeComponent (item, 				constituentItem, constituentItemAmount)  	 			   
	 VALUES 				('Science pack 1', 	'Copper plate', '1'),
	 						('Science pack 1', 	'Iron gear wheel', '1'),
	 						('Iron gear wheel', 'Iron plate', '2');

-- (Recipe Amount Produced / Time for Recipe) * Crafting speed
drop view if exists greyRecipe;
create view greyRecipe as
SELECT recipe.item,
	  (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed as amountPerSecond
	  from recipe, craftingMachine
	  WHERE craftingMachine.craftingName = 'Assembling machine 1';

DROP VIEW if exists greyRecipePerSecond;
CREATE VIEW greyRecipePerSecond as
SELECT item, amountPerSecond, constituentItem, constituentItemAmount*amountPerSecond as constituentItemAmountPerSecond
  FROM greyRecipe 
  JOIN recipeComponent USING (item) ;


-- outputAmount / amountPerSecond 

SELECT item, targetAmount, targetAmount / amountPerSecond as numCraftingMachines , constituentItem, constituentItemAmountPerSecond
  FROM greyRecipePerSecond, outputTarget;

select 'Valete sodales';
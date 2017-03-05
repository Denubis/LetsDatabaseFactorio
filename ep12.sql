select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	            VALUES('12', 	   'Starting the greenhouse loop', 'Now we need to deploy our greenhouses.');

SELECT EpisodeID, EpisodeName, Description from episode order by episodeid desc limit 1;	         

								 																																																																																																																																																			 
SELECT listID, title, EpisodeID, tododescription
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


REPLACE INTO recipe (item,            amount, craftingSpeed) 
     VALUES      ('Cellulose Fiber',   4,    2),
                 ('Wood Pellets',   2,    4),
                 ('Raw wood',   10,    60),
                 ('Wood Bricks',   4,    2);


REPLACE INTO recipeComponent (item,             constituentItem, constituentItemAmount)            
   VALUES         ('Cellulose Fiber',    'Raw wood',     1),
                  ('Raw wood',          'Seedling',     10),
                  ('Wood Pellets',   'Cellulose Fiber',  12),
                  ('Wood Bricks',   'Wood Pellets',      8)
                    ;

REPLACE INTO outputTarget(targetName,       targetAmount) 
   VALUES         ('Yellow Belt 1 side',  20*1.0/3);

   


drop view if exists recipeTarget;
create view recipeTarget as
SELECT item, 
       targetAmount, 
       (targetAmount / amountPerSecond) as numCraftingMachines, 
       constituentItem, 
       craftingName,
       targetName,
       (constituentItemAmount*craftingSpeed)*(targetAmount / amountPerSecond) as constituentTotalItemAmountPerSecond
  FROM (SELECT recipe.item
             , craftingMachine.craftingName
             , (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed as amountPerSecond
             , (1/recipe.craftingSpeed)*craftingmachine.craftingSpeed as craftingSpeed
        FROM recipe, craftingMachine)
  JOIN recipeComponent USING (item)
     , outputTarget;

select primaryRecipe.item
     , primaryRecipe.numCraftingMachines     
     , secondaryRecipe.item
     , primaryRecipe.constituentTotalItemAmountPerSecond*secondaryRecipe.numCraftingMachines as secondaryCraftingMachines
     , tertiaryRecipe.item
     , primaryRecipe.constituentTotalItemAmountPerSecond*secondaryRecipe.numCraftingMachines*secondaryRecipe.constituentTotalItemAmountPerSecond*tertiaryRecipe.numCraftingMachines as tertiaryCraftingMachines
  from recipeTarget as primaryRecipe
  left outer join recipeTarget as secondaryRecipe on (primaryRecipe.constituentItem = secondaryRecipe.item)
  left outer join recipeTarget as tertiaryRecipe  on (secondaryRecipe.constituentItem = tertiaryRecipe.item)
  where primaryRecipe.item = 'Wood Bricks'
    and primaryRecipe.targetName = '1 per Second'
    and primaryRecipe.craftingName = 'Assembling machine 1'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Assembling machine 1'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Assembling machine 1';


select 'Valete sodales';

/*
INSERT INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
 	 VALUES 			    ('Assembling machine 1', '100', '3.3', '0.5'),
 	 						('Ore Crusher', '100', '3.3', '1.5');

INSERT INTO outputTarget(targetName, 			targetAmount) 
	 VALUES 		    ('1 per Second', 		1),
						('Yellow Belt 1 side', 	40*1.0/3);

INSERT INTO recipe (item, 						amount, craftingSpeed) 
  	 VALUES 	   ('Science pack 1', 			1,		5),
  	 			   ('Iron gear wheel',			1,		0.5),
  	 			   ('Iron plate',				2,		7),
  	 			   ('Copper plate',				2,		7),
  	 			   ('Crushed Saphirite',	2,		1),
  	 			   ('Crushed Stiratite',	2,		1);

INSERT INTO recipeComponent (item, 				constituentItem, constituentItemAmount)  	 			   
	 VALUES 				('Science pack 1', 	'Copper plate', 	1),
	 						('Science pack 1', 	'Iron gear wheel', 	1),
	 						('Iron gear wheel', 'Iron plate', 		2),
	 						('Iron plate', 		'Crushed Saphirite',	 	3),
	 						('Copper plate', 'Crushed Stiratite', 		3),
	 						('Crushed Saphirite',	'Saphirite Ore', 	2),
	 						('Crushed Stiratite', 	'Stiratite Ore',	2)
	 						;

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
drop view if exists greyRecipeTarget;
create view greyRecipeTarget as
SELECT item, targetName, (targetAmount / amountPerSecond) as numCraftingMachines , constituentItem, (constituentItemAmountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
  FROM greyRecipePerSecond, outputTarget;



SELECT *
  FROM greyRecipeTarget
  WHERE item = 'Iron plate'
  and targetName = '1 per Second';


SELECT *
  FROM greyRecipeTarget
  WHERE item = 'Science pack 1'
  and targetName = '1 per Second';




  

SELECT item, 
       targetName, 
       (targetAmount / amountPerSecond) as numCraftingMachines, 
       constituentItem, 
       (constituentItemAmount*amountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
  FROM (SELECT recipe.item,
	  		   (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed as amountPerSecond
	  	  FROM recipe, craftingMachine
	     WHERE craftingMachine.craftingName = 'Ore Crusher')
  JOIN recipeComponent USING (item)
     , outputTarget
 WHERE item = 'Crushed Saphirite';


replace into todoliststate(listid, stateid) VALUES(5,1),(4,1),(3,1);
*/

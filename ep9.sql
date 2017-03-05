select 'Salvite sodales and Hello Youtube!';
delete from episode where episodeid = 10;

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('9', 	   'Redoing furnace columns.', 'A report on the investigation of why traditional furnace columns are 12 long.');

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


REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Steel furnace', null, null, '2');

REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Mk1 Smeltery', null, null, '0.75');



REPLACE INTO recipe (item, 						amount, craftingSpeed) 
  	 VALUES 	   ('Copper Ingot',		5,		4),
                 ('Molten Copper',   3,    4),
                 ('Copper plate from molten',   2,    4);


REPLACE INTO recipeComponent (item, 						constituentItem, constituentItemAmount)  	 			   
	 VALUES 				('Copper Ingot', 	  'Copper ore', 	  5),
                  ('Molten Copper',   'Copper Ingot',   3),
                  ('Copper plate from molten',   'Molten Copper',   2);

REPLACE INTO outputTarget(targetName, 			targetAmount) 
	 VALUES 		    ('Yellow Belt 1 side', 	20*1.0/3),
                  ('Molten Copper', 14),
                  ('Copper Ingot', 42);

.width 30  
SELECT item, 
       targetName, 
       ceiling(targetAmount / amountPerSecond) as numCraftingMachines, 
       constituentItem, 
       ceiling(constituentItemAmount*amountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
  FROM (SELECT recipe.item,
	  		   (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed * recipe.amount as amountPerSecond
	  	  FROM recipe, craftingMachine
	     WHERE craftingMachine.craftingName = 'Mk1 Smeltery')

  JOIN recipeComponent USING (item)
     , outputTarget
 WHERE item = 'Copper plate from molten'
   AND targetName LIKE 'Yellow%';


SELECT item, 
       targetName, 
       ceiling(targetAmount / amountPerSecond) as numCraftingMachines, 
       constituentItem, 
       ceiling(constituentItemAmount*amountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
  FROM (SELECT recipe.item,
           (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed * recipe.amount as amountPerSecond
        FROM recipe, craftingMachine
       WHERE craftingMachine.craftingName = 'Mk1 Smeltery')

  JOIN recipeComponent USING (item)
     , outputTarget
 WHERE item = 'Molten Copper'
   AND targetName LIKE 'Molten Copper';

SELECT item, 
       targetName, 
       ceiling(targetAmount / amountPerSecond) as numCraftingMachines, 
       constituentItem, 
       ceiling(constituentItemAmount*amountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
  FROM (SELECT recipe.item,
           (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed * recipe.amount as amountPerSecond
        FROM recipe, craftingMachine
       WHERE craftingMachine.craftingName = 'Mk1 Smeltery')

  JOIN recipeComponent USING (item)
     , outputTarget
 WHERE item = 'Copper Ingot'
   AND targetName LIKE 'Copper Ingot';


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
SELECT item, targetName, ceiling(targetAmount / amountPerSecond) as numCraftingMachines , constituentItem, ceiling(constituentItemAmountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
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
       ceiling(targetAmount / amountPerSecond) as numCraftingMachines, 
       constituentItem, 
       ceiling(constituentItemAmount*amountPerSecond*(targetAmount / amountPerSecond)) as constituentTotalItemAmountPerSecond
  FROM (SELECT recipe.item,
	  		   (recipe.amount/recipe.craftingSpeed) * craftingMachine.craftingSpeed as amountPerSecond
	  	  FROM recipe, craftingMachine
	     WHERE craftingMachine.craftingName = 'Ore Crusher')
  JOIN recipeComponent USING (item)
     , outputTarget
 WHERE item = 'Crushed Saphirite';


replace into todoliststate(listid, stateid) VALUES(5,1),(4,1),(3,1);
*/

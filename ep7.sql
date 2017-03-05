select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('7', 	   'buildBase( buildBase() )', 'Setting up necessary precursor infrastructure before the main bus needed to build the base is built. Yay recursion.');

SELECT EpisodeID, EpisodeName, Description from episode order by episodeid desc limit 1;	         

replace into todoliststate(listid, stateid) VALUES(6,1);


REPLACE INTO todolist ( ListID, 	EpisodeID, 	Title,			
						todoDescription)
				VALUES(	7, 			7,			'Pre-base base assembly machines.', 		
						'Build pre-base grey factories for factory making and belt making.'),
					  (	8, 			7,			'Wood cycle.', 		
						'Get a basic greenhouse wood cycle going.');	

REPLACE INTO todolistState(listid) VALUES(7),(8);
									 																																																																																																																																																			 
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

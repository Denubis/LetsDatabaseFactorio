select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	            VALUES('31', 	   
                     'Continued praises of Beb!',
                     'We''re getting there at least...');

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
.width 40
--select * from craftingMachine;

--select * from recipe where item like 'Crushed%';

REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Liquifier', '100', '3.3', 1.5);

REPLACE INTO recipe (item,              amount, craftingSpeed) 
     VALUES      ('Basic electronic board', 1,      1),
                 ('Basic electronic components',       5,      2),
                 ('Tinned copper wire',       3,      0.5)
                 
                 ;

REPLACE INTO recipeComponent (item,        constituentItem, constituentItemAmount)            
   VALUES         ('Basic electronic board',   'Basic circut board',     1),
                  ('Basic electronic board',   'Basic electronic components',     5),
                  ('Basic electronic board',   'Solder',     1),
                  ('Basic electronic components', 'Tinned copper wire', 1),
                  ('Basic electronic components', 'Carbon', 1),
                  ('Tinned copper wire', 'Tin plate',1),
                  ('Tinned copper wire', 'Copper cable',3);
                  

--select * from outputTarget;   



.width 100





select primaryRecipe.item 
       || ' * ' || round(primaryRecipe.numCraftingMachines,1)
       || ' <- ' || secondaryRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines,1) 
       || ' <- ' || tertiaryRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines
       * primaryRecipe.numCraftingMachines
       * secondaryRecipe.constituentTotalItemAmountPerSecond
       * tertiaryRecipe.numCraftingMachines,1) 
       
       
       as craftSequence
  from recipeTarget as primaryRecipe
  left outer join recipeTarget as secondaryRecipe on (primaryRecipe.constituentItem = secondaryRecipe.item)
  left outer join recipeTarget as tertiaryRecipe  on (secondaryRecipe.constituentItem = tertiaryRecipe.item)
   where primaryRecipe.item = 'Basic electronic board'
    and primaryRecipe.targetName = 'Yellow Belt 1 side'
    and primaryRecipe.craftingName = 'Electronics assembling machine 1'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Electronics assembling machine 1'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Electronics assembling machine 1';


select 'Valete sodales';

/*



select primaryRecipe.item 
       || ' * ' || round(primaryRecipe.numCraftingMachines,1)
       || ' <- ' || secondaryRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines,1) 
       || ' <- ' || tertiaryRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines
       * secondaryRecipe.constituentTotalItemAmountPerSecond
       * tertiaryRecipe.numCraftingMachines,1) 
       as craftSequence
  from recipeTarget as primaryRecipe
  left outer join recipeTarget as secondaryRecipe on (primaryRecipe.constituentItem = secondaryRecipe.item)
  left outer join recipeTarget as tertiaryRecipe  on (secondaryRecipe.constituentItem = tertiaryRecipe.item)
   where primaryRecipe.item = 'Wood Pellets'
    and primaryRecipe.targetName = '1 per Second'
    and primaryRecipe.craftingName = 'Liquifier'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Assembling machine 1'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Assembling machine 1';


select primaryRecipe.item 
       || ' * ' || round(primaryRecipe.numCraftingMachines,1)
     || ' <- ' || secondaryRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines,1) as secondaryCraftingMachines

  from recipeTarget as primaryRecipe
  left outer join recipeTarget as secondaryRecipe on (primaryRecipe.constituentItem = secondaryRecipe.item)
where primaryRecipe.item = 'Carbon'
    and primaryRecipe.targetName = 'Yellow Belt 1 side'
    and primaryRecipe.craftingName = 'Liquifier'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Liquifier'
 
    ;


replace into todoliststate(listid, stateid) VALUES(5,1),(4,1),(3,1);
*/

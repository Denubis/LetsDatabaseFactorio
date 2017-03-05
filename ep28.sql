select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	            VALUES('28', 	   
                     'Carbon', 
                     'With solder done and wood debugged, now to the final step: carbon.');

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
select * from craftingMachine;

--select * from recipe where item like 'Crushed%';

REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Liquifier', '100', '3.3', 1.5);

REPLACE INTO recipe (item,            amount, craftingSpeed) 
     VALUES      ('Carbon',           3,      2),
                 ('Coke',             2,     1),
                 ('Carbon Dioxide',        7,      2)
                 
                 ;

REPLACE INTO recipeComponent (item,        constituentItem, constituentItemAmount)            
   VALUES         ('Carbon',          'Coke',      2),
                  ('Carbon',          'Carbon Dioxide',     3.5),
                  ('Coke',            'Crushed Coal',      2),
                  ('Carbon Dioxide',  'Wood Pellets',      1);

--select * from outputTarget;   



.width 80



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
   where primaryRecipe.item = 'Carbon'
    and primaryRecipe.targetName = 'Yellow Belt 1 side'
    and primaryRecipe.craftingName = 'Liquifier'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Stone Furnace'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Liquifier';


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

select 'Valete sodales';

/*


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

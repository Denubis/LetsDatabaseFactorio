select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
              VALUES('42',     
                     'Back to the pre-base main bus',
                     'Working our ratios for belts');

select count(*) from episode where uploaddate is null;
SELECT EpisodeID, EpisodeName, Description from episode order by episodeid desc limit 1;	         
/*
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

*/




REPLACE INTO recipe (item,                     amount, craftingSpeed) 
     VALUES         ('Fast transport belt',    1,      0.5),
                    ('Underground belt',       2,      0.5),
                    ('Fast underground belt',  2,      0.5),
                    ('Splitter',               1,      1),
                    ('Fast splitter',          1,      2),
                    ('Loader',                 1,      1),
                    ('Fast loader',            1,      3),
                    ('Fast inserter',          1,      0.5),
                    ('Filter inserter',        1,      0.5),
                    ('Assembling machine 1',   1,      0.5),
                    ('Assembling machine 2',   1,      0.5),
                    ('Electronics assembling machine 1',   1,      0.5),
                    ('Ore Processing Machine MK1',         1,      10),
                    ('Ore Processing Machine MK2',         1,      10),
                    ('Pellet Press MK1',       1,      10),
                    ('Blast Furnace MK1',      1,      10),
                    ('Blast Furnace MK2',      1,      10),
                    ('Induction Furnace MK1',  1,      10),
                    ('Induction Furnace MK2',  1,      10),
                    ('Casting Machine MK1',    1,      10),
                    ('Casting Machine MK2',    1,      10),
                    ('Chemical plant',         1,      10),
                    ('Warehouse',              1,      0.5),
                    ('Medium electronic pole', 1,      0.5),
                    ('Big electronic pole',    1,      0.5),
                    ('Iron pipe',              1,      0.5)
                 ;

REPLACE INTO recipeComponent (item,        constituentItem, constituentItemAmount)            
   VALUES         ('Nanobot construction bots',   'Basic circuit board',     1),
                  ('Fast transport belt',   'Iron gear wheel',    5),
                  ('Fast transport belt',   'Transport belt',     1),
                  ('Underground belt',      'Transport belt',     6),
                  ('Underground belt',      'Iron plate',         10),
                  ('Fast underground belt',      'Fast transport belt',     6),
                  ('Fast underground belt',      'Iron gear wheel',         20),
                  ('Fast underground belt',      'Underground belt',        2),
                  ('Splitter',      'Iron plate',                  5),
                  ('Splitter',      'Transport belt',               4),
                  ('Splitter',      'Basic circuit board',         5),
                  ('Fast splitter',      'Splitter',               1),
                  ('Fast splitter',      'Iron gear wheel',        10),
                  ('Fast splitter',      'Basic electronic board', 10),
                  ('Loader',      'Inserter', 5),
                  ('Loader',      'Basic electronic board', 5),
                  ('Loader',      'Iron gear wheel', 5),
                  ('Loader',      'Iron plate', 5),
                  ('Loader',      'Transport belt', 5),
                  ('Fast loader',      'Fast transport belt', 5),
                  ('Fast loader',      'Loader', 1),
                  ('Fast inserter',      'Basic electronic board', 2),
                  ('Fast inserter',      'Iron plate', 2),
                  ('Fast inserter',      'Inserter', 1),
                  ('Filter inserter',      'Fast inserter', 1),
                  ('Filter inserter',      'Basic electronic board', 4),
                  ('Assembling machine 1', 'Iron gear wheel', 0.5),
                  ('Assembling machine 1', 'Iron plate', 9),
                  ('Assembling machine 1', 'Basic circuit board', 3),
                  ('Assembling machine 2', 'Basic electronic board', 3),
                  ('Assembling machine 2', 'Iron plate', 9),
                  ('Assembling machine 2', 'Iron gear wheel', 5),
                  ('Assembling machine 2', 'Assembling machine 1', 1),
                  ('Electronics assembling machine 1', 'Iron plate', 5),
                  ('Electronics assembling machine 1', 'Iron gear wheel', 5),
                  ('Electronics assembling machine 1', 'Basic circuit board', 5),
                  ('Chemical plant', 'Steel plate', 5),
                  ('Chemical plant', 'Iron gear wheel', 5),
                  ('Chemical plant', 'Basic electronic board', 5),
                  ('Chemical plant', 'Iron pipe', 5),
                  ('Ore Processing Machine MK1', 'Iron plate', 10),
                  ('Ore Processing Machine MK1', 'Stone brick', 30),
                  ('Ore Processing Machine MK1', 'Basic circuit board', 5),
                  ('Ore Processing Machine MK2', 'Basic electronic board', 5),
                  ('Ore Processing Machine MK2', 'Stone brick', 30),
                  ('Ore Processing Machine MK2', 'Steel plate', 10),
                  ('Ore Processing Machine MK2', 'Ore Processing Machine MK1', 1),
                  ('Pellet Press MK1', 'Iron plate', 10),
                  ('Pellet Press MK1', 'Stone brick', 30),
                  ('Pellet Press MK1', 'Basic circuit board', 5),
                  ('Blast Furnace MK1', 'Steel plate', 10),
                  ('Blast Furnace MK1', 'Stone brick', 20),
                  ('Blast Furnace MK1', 'Iron pipe', 5),
                  ('Blast Furnace MK2', 'Blast Furnace MK1', 1),
                  ('Blast Furnace MK2', 'Aluminium plate', 10),
                  ('Blast Furnace MK2', 'Stone brick', 20),
                  ('Blast Furnace MK2', 'Iron pipe', 5),
                  ('Induction Furnace MK1', 'Iron plate', 10),
                  ('Induction Furnace MK1', 'Stone brick', 30),
                  ('Induction Furnace MK1', 'Basic circuit board', 5),
                  ('Induction Furnace MK2', 'Basic electronic board', 5),
                  ('Induction Furnace MK2', 'Induction Furnace MK1', 1),
                  ('Induction Furnace MK2', 'Steel plate', 10),
                  ('Induction Furnace MK2', 'Stone brick', 30),
                  ('Induction Furnace MK2', 'Basic electronic board', 5),
                  ('Casting Machine MK1', 'Iron plate', 10),
                  ('Casting Machine MK1', 'Stone brick', 30),
                  ('Casting Machine MK1', 'Basic circuit board', 5),
                  ('Casting Machine MK2', 'Basic electronic board', 5),
                  ('Casting Machine MK2', 'Stone brick', 30),
                  ('Casting Machine MK2', 'Steel plate', 10),
                  ('Casting Machine MK2', 'Casting Machine MK1', 1),
                  ('Warehouse', 'Steel plate', 60),
                  ('Warehouse', 'Iron plate', 100),
                  ('Warehouse', 'Stone brick', 25),
                  ('Warehouse', 'Wooden chest', 10),
                  ('Medium electronc pole', 'Steel plate', 2),                  
                  ('Medium electronc pole', 'Copper plate', 2),                  
                  ('Big electronc pole', 'Steel plate', 5),                  
                  ('Big electronc pole', 'Copper plate', 5);                  

.width 100

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
   where primaryRecipe.item = 'Iron gear wheel'
    and primaryRecipe.targetName = '1 per Second'
    and primaryRecipe.craftingName = 'Yellow Belt 1 side'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Assembling machine 2'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Assembling machine 2';



select primaryRecipe.item 
       || ' * ' || round(primaryRecipe.numCraftingMachines,1)
       || ' <- ' || secondaryRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       
       * secondaryRecipe.numCraftingMachines,1)               
       as craftSequence
  from recipeTarget as primaryRecipe
  left outer join recipeTarget as secondaryRecipe on (primaryRecipe.constituentItem = secondaryRecipe.item)
  
   where primaryRecipe.item = 'Iron gear wheel'
    and primaryRecipe.targetName = 'Yellow Belt 1 side'
    and primaryRecipe.craftingName = 'Assembling machine 2'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Assembling machine 2'
    ;

/*
From robot army wiki:

The concept is simple - manufacture droid soldiers, and insert them into a Droid Assembler where they are produced (spawned nearby). The newly created soldier will join a nearby squad if one exists, or it will start its own squad and wait until more robots join.
                                                      
When the squad is large enough (currently 5 by default, change it in config.lua) the squad will begin moving to attack the nearest biter nest (within 2.5k tiles) or other enemy force's units/buildings.

Droids are deployed by building a Droid Assembling Machine (Droid Assembler ) and inserting the Droid (Undeployed) item into it, for whatever type of droid you wanted to deploy. The mod script will scan each Droid Assembler's output inventory for a "Deployed" version of a droid and will cause the appropriate droid to spawn nearby the Droid Assembler, in the direction that it is facing (see pipe arrows). You can also deploy droids simply by having the items in your hand and clicking to place like any other object/item. This means you can keep a pocket-army with you for tight situations.

In addition to automatically deploying droids from Droid Assemblers to attack nearby biters, you can build Droid Guard Stations and put droid items in for deployment, the same as with the Droid Assemblers. The guard stations allow you to have a group of droids (10, currently) defend their nearby area (they will not go hunting). The guard station will not spawn any more droids if it counts more than 10 within 16 tile radius. 

To help clean up your battlefield or find random lost squads, you can build and place a rally point to trigger all squads on your force (EXCEPT guard squads!) to move-to the position of the rally point. 

Basically you can set up chains of a special power pole type object using green wires to join them, and guard station squads can be made to patrol along the length of the patrol route. Keep in mind this is WIP, and there might be pathfinding issues and traffic jams in some cases. Try to spread out the patrol route and have a fairly long gap between posts.

*/
select 'Valete sodales';

/*

select * from recipe where item like 'Basic%';

REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Assembling machine 2', '135', '3.3', 0.75);

REPLACE INTO recipe (item,              amount, craftingSpeed) 
     VALUES      ('Nanobot construction bots', 1,      5),
                 ('Repair pack',       1,      0.5)
                 
                 ;

REPLACE INTO recipeComponent (item,        constituentItem, constituentItemAmount)            
   VALUES         ('Nanobot construction bots',   'Copper plate',          5),
                  ('Nanobot construction bots',   'Repair pack',     1),
                  ('Nanobot construction bots',   'Basic circut board',     1),
                  ('Inserter',   'Iron plate',     1),
                  ('Inserter',   'Basic circuit board',     1),                  
                  ('Transport belt',   'Iron gear wheel',     1),
                  ('Transport belt',   'Iron plate',     1)
                  ;

                  

--select * from outputTarget;   



.width 100





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
   where primaryRecipe.item = 'Science pack 2'
    and primaryRecipe.targetName = '1 per Second'
    and primaryRecipe.craftingName = 'Assembling machine 2'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Assembling machine 2'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Assembling machine 2';


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

select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
              VALUES('85',     
                     'A red belt of bioplastic' ,
                     'Yeeeeeesh. This took a while.');


--select episodeid from episode;

/*
Electronic Circut Critical Path:
  x Automatic building of refining buildings
  x Quartz refining
  x Silicon plate production
  Plastic bar from wood production
  Circuit boards
  Electronic circuit boards

*/


SELECT EpisodeID, EpisodeName, Description from episode order by episodeid desc limit 1;	         


select count(*), episodename, group_concat(episodeid) from episode group by episodename having count(*) > 1;
select count(*) from episode;
select count(*) from episode where uploaddate is null;

/*
SELECT listID, title, EpisodeID, tododescription
  from todolist 
  JOIN todoliststate USING (listid)
  JOIN todostate USING (stateID)
  JOIN episode USING (EpisodeID)
  WHERE stateID = 0
    AND listID not in (SELECT listid aw
    	                 from todolist 
    	                 join todoliststate using (listid) 
    	                where stateID IN (1,2))
  order by listID desc;
.width 40
--

*/

select * from craftingMachine;
REPLACE INTO outputTarget(targetName,       targetAmount) 
   VALUES         ('Yellow Belt 1 side',  20*1.0/3),
                  ('Red Belt 1 side',  20*1.0/3*2);

REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Blast Furnace MK2', '135', '3.3', 1.25);


REPLACE INTO recipe (item,              amount, craftingSpeed) 
     VALUES      ('Raw wood',    10,         60),
                 ('Seedling',    1.5,         0.5),
                 ('Methanol Gas',  10,         30),
                 ('Cellulose Fiber',    4,    2)

                 ;

REPLACE INTO recipeComponent (item,        constituentItem, constituentItemAmount)            
   VALUES         ('Raw wood', 'Seedling',            10),
                  ('Methanol Gas', 'Cellulose Fiber', 20),
                  ('Cellulose Fiber', 'Raw wood',      1),
                  ('Seedling',   'Raw wood',           1)

                  ;
                  

.width 120

select primaryRecipe.item || ' * ' 
       || round(primaryRecipe.numCraftingMachines,1) || ' <- ' 
       || secondaryRecipe.item || ' * ' 
       || round(primaryRecipe.constituentTotalItemAmountPerSecond       
               * secondaryRecipe.numCraftingMachines,1)
       || ' <- ' 
       || tertiaryRecipe.item || ' * ' 
       || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines       
       * secondaryRecipe.constituentTotalItemAmountPerSecond
       * tertiaryRecipe.numCraftingMachines,1) 
       || ' <- ' || quadRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines
       * secondaryRecipe.constituentTotalItemAmountPerSecond
       * tertiaryRecipe.numCraftingMachines
       * tertiaryRecipe.constituentTotalItemAmountPerSecond
       * quadRecipe.numCraftingMachines,1) 
       || ' <- ' || quinRecipe.item || ' * ' || round(primaryRecipe.constituentTotalItemAmountPerSecond
       * secondaryRecipe.numCraftingMachines       
       * secondaryRecipe.constituentTotalItemAmountPerSecond
       * tertiaryRecipe.numCraftingMachines
       * tertiaryRecipe.constituentTotalItemAmountPerSecond
       * quadRecipe.numCraftingMachines
       * quadRecipe.constituentTotalItemAmountPerSecond
       * quinRecipe.numCraftingMachines
       ,1) 
       
       as craftSequence
  from recipeTarget as primaryRecipe
  left outer join recipeTarget as secondaryRecipe on (primaryRecipe.constituentItem = secondaryRecipe.item)
  left outer join recipeTarget as tertiaryRecipe  on (secondaryRecipe.constituentItem = tertiaryRecipe.item)
  left outer join recipeTarget as quadRecipe  on (tertiaryRecipe.constituentItem = quadRecipe.item)
  left outer join recipeTarget as quinRecipe  on (quadRecipe.constituentItem = quinRecipe.item)
  left outer join recipeTarget as sexRecipe  on (quinRecipe.constituentItem = sexRecipe.item)
   where primaryRecipe.item = 'Plastic Bar'
    and primaryRecipe.targetName = 'Red Belt 1 side'
    and primaryRecipe.craftingName = 'Blast Furnace MK2'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Stone Furnace'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Blast Furnace MK2'
    and quadRecipe.targetName = '1 per Second'
    and quadRecipe.craftingName = 'Assembling machine 2'
    and quinRecipe.targetName = '1 per Second'
    and quinRecipe.craftingName = 'Assembling machine 2'
    and sexRecipe.targetName = '1 per Second'
    and sexRecipe.craftingName = 'Assembling machine 2'
;

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
  
   where primaryRecipe.item = 'Cellulose Fiber'
    and primaryRecipe.targetName = 'Red Belt 1 side'
    and primaryRecipe.craftingName = 'Assembling machine 2'
    and secondaryRecipe.targetName = '1 per Second'
    and secondaryRecipe.craftingName = 'Stone Furnace'
    and tertiaryRecipe.targetName = '1 per Second'
    and tertiaryRecipe.craftingName = 'Blast Furnace MK2'
   
;


/*
From uranium power

Gross Power up to 265 MW
Upkeep Power of 6.6 MW => Simple fuel enrichment, ~50 MW => SImple fuel enrichment + Fuel reprocessing
Simple enrichment only concentrates U-235 to 1.7%, but that is sufficient for crafting MOX fuel. A complete enrichment of U-235 at 4.7% is recommended for at least the first two rounds of fueling the reactor.
Net Power production is ~215-258 MW


*/

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
                  ('Nanobot construction bots',   'Basic circuit board',     1),
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

.header off
select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
              VALUES('91',     
                     'Cleaning up old power.' ,
                     'Angel''s patches and cleaning up power in the way');


--select episodeid from episode;

/*
Electronic Circut Critical Path:
  x Automatic building of refining buildings
  x Quartz refining
  x Silicon plate production
  x Plastic bar from wood production
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


--select * from craftingMachine;
REPLACE INTO outputTarget(targetName,       targetAmount) 
   VALUES         ('Red Belt 2 side',  20*1.0/3*2*2);

REPLACE INTO craftingMachine (craftingName, electricConsumption, drain, craftingSpeed)
   VALUES           ('Blast Furnace MK2', '135', '3.3', 1.25);


REPLACE INTO recipe (item,           amount, craftingSpeed) 
     VALUES      ('Copper plate',    4,    4),
                 ('Molten Copper',   12,   4),
                 ('Copper Ingot',    12,   6),
                 ('Copper Anode',    24,   4),
                 ('Copper Pellet',   12,   2),
                 ('Processed Copper',2,    2),
                 ('Oxygen Gas',      4,    2),
                 ('Tin plate',       2,    4),
                 ('Molten Tin',      3,    4),
                 ('Tin Ingot',       6,    4),                 
                 ('Processed Tin',   1,    2)                 
                 ;

delete from recipeComponent where item = 'Copper Ingot' and constituentItem = 'Copper Pellet';

REPLACE INTO recipeComponent (item,        constituentItem, constituentItemAmount)            
   VALUES         ('Copper plate',  'Molten Copper',    4),
                  ('Molten Copper', 'Copper Ingot',     12),
                  ('Copper Ingot',  'Copper Anode',     12),
                  ('Copper Ingot',  'Sulfuric Acid',    3),
                  ('Copper Anode',  'Copper Pellet',    24),                  
                  ('Copper Anode',  'Oxygen Gas',       6),                  
                  ('Copper Pellet', 'Processed Copper', 3),
                  ('Processed Copper', 'Copper ore',    4),
                  ('Oxygen Gas', 'Purified Water',      10),
                  ('Tin plate',     'Molten Tin',    2),
                  ('Molten Tin',    'Tin Ingot',     3),
                  ('Tin Ingot',     'Processed Tin', 1),
                  ('Processed Tin', 'Tin ore',       4)

                  ;
                  



REPLACE INTO craftingMachine (craftingName, craftingSpeed)
   VALUES  ('Electrolyser MK2', '1.5'), 
           ('Hydro Plant', '1'),
           ('Blast Furnace MK1', '0.75'),
           ('Pellet Press MK1', '0.75'),
           ('Ore Processing Machine MK2', '1')
           ;




.header on
.mode line
--.width 10 5 10 5 10 5 10 5 10 5 10 5 10 5

select r1.item as 'r1i',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3',
       r3.constituentItem  as 'r4i', ceil(((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)  as 'r4',
       r4.constituentItem  as 'r5i', ceil((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)  as 'r5',
       r5.constituentItem  as 'r6i', ceil(((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)  as 'r6',
       r6.constituentItem  as 'r7i', ceil((((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)*r6.constituentAPS/r7.amountPerSecond)  as 'r7'  
            
from (select * from recipeTarget where item in ('Copper plate') and craftingName = 'Casting Machine MK2' and targetName = 'Red Belt 1 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Induction Furance MK2' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Blast Furnace MK1' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Pellet Press MK1' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Ore Processing Machine MK2' and targetName = '1 per Second') r5 on (r4.constituentItem = r5.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 2' and targetName = '1 per Second') r6 on (r5.constituentItem = r6.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 2' and targetName = '1 per Second') r7 on (r6.constituentItem = r7.item);



select r1.item as 'r1i',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3',
       r3.constituentItem  as 'r4i', ceil(((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)  as 'r4'
      
            
from (select * from recipeTarget where item in ('Electronic circuit board') and craftingName = 'Electronics assembling machine 1' and targetName = 'Red Belt 2 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Electronics assembling machine 1' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Chemical plant' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Chemical plant' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item);




select r1.item as 'r1i',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3',
       r3.constituentItem  as 'r4i', ceil(((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)  as 'r4',
       r4.constituentItem  as 'r5i', ceil((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)  as 'r5'
            
from (select * from recipeTarget where item in ('Ferric chloride solution') and craftingName = 'Chemical plant' and targetName = 'Red Belt 1 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Chemical plant' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Electrolyser MK2' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Hydro Plant' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Ore Processing Machine MK2' and targetName = '1 per Second') r5 on (r4.constituentItem = r5.item);

/*
The first stage is a faithful image/copy, where we believe, and it may even be correct, that a sign is a "reflection of a profound reality" (pg 6), this is a good appearance, in what Baudrillard called "the sacramental order".
The second stage is perversion of reality, this is where we come to believe the sign to be an unfaithful copy, which "masks and denatures" reality as an "evil appearance—it is of the order of maleficence". Here, signs and images do not faithfully reveal reality to us, but can hint at the existence of an obscure reality which the sign itself is incapable of encapsulating.
The third stage masks the absence of a profound reality, where the sign pretends to be a faithful copy, but it is a copy with no original. Signs and images claim to represent something real, but no representation is taking place and arbitrary images are merely suggested as things which they have no relationship to. Baudrillard calls this the "order of sorcery", a regime of semantic algebra where all human meaning is conjured artificially to appear as a reference to the (increasingly) hermetic truth.
The fourth stage is pure simulacrum, in which the simulacrum has no relationship to any reality whatsoever. Here, signs merely reflect other signs and any claim to reality on the part of images or signs is only of the order of other such claims. This is a regime of total equivalency, where cultural products need no longer even pretend to be real in a naïve sense, because the experiences of consumers' lives are so predominantly artificial that even claims to reality are expected to be phrased in artificial, "hyperreal" terms. Any naïve pretension to reality as such is perceived as bereft of critical self-awareness, and thus as oversentimental.

select r1.item as 'r1i',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3',
       r3.constituentItem  as 'r4i', ceil(((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)  as 'r4',
       r4.constituentItem  as 'r5i', ceil((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)  as 'r5'
            
from (select * from recipeTarget where item in ('Copper plate') and craftingName = 'Casting Machine MK2' and targetName = 'Red Belt 1 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Induction Furance MK2' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Blast Furnace MK1' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Pellet Press MK1' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Ore Processing Machine MK2' and targetName = '1 per Second') r5 on (r4.constituentItem = r5.item);


r5.constituentItem  as 'r6i', ceil(((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)  as 'r6',
       r6.constituentItem  as 'r7i', ceil((((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)*r6.constituentAPS/r7.amountPerSecond)  as 'r7'  

LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 2' and targetName = '1 per Second') r6 on (r5.constituentItem = r6.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 2' and targetName = '1 per Second') r7 on (r6.constituentItem = r7.item)
*/

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

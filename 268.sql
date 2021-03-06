.header off
select 'Salvite sodales and Hello Youtube!';

-- production of beacon mark 3's

-- @10 parts per second. rocket silo +300%
-- 1 4x beacon row of 7 for low density structures

-- 1 4x beacon row of 7 for rocket-control-unit
-- 1 5x beacon row of 9 for Speed module 1

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
              VALUES('268',     
                     'Planning Rocket Infrastructure',
                     'Preparing to plan to make a plan to investigate methods... the NASA way.
                     ');

select distinct printf('For %s %s, producing %s per second, using %s machines,
   %i %s: %s (%s)
<2- %i %s: %s (%s)
<3- %i %s: %s (%s)
<4- %i %s: %s (%s)
<5- %i %s: %s (%s)
<6- %i %s: %s (%s)
<7- %i %s: %s (%s)
<8- %i %s: %s (%s)
  ', r1i, targetName,  targetAmount, coalesce(r1,0)+coalesce(r2,0)+coalesce(r3,0)+coalesce(r4,0)+coalesce(r5,0)+coalesce(r6,0)+coalesce(r7,0)
   , r1, r1c, r1i, r1r
   , r2, r2c, r2i, r2r
   , r3, r3c, r3i, r3r
   , r4, r4c, r4i, r4r
   , r5, r5c, r5i, r5r
   , r6, r6c, r6i, r6r
   , r7, r7c, r7i, r7r
   )
FROM (
select r1.targetName, r1.targetAmount, r1.item 'r1i',  r1.craftingname 'r1c', r1.recipe as 'r1r',  r1.numCraftingMachines/r1productivityratio as 'r1', 
       r1.constituentItem as 'r2i',r2.craftingname 'r2c', r2.recipe as 'r2r', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)/r2productivityratio  as 'r2',
       r2.constituentItem as 'r3i',r3.craftingname 'r3c',  r3.recipe as 'r3r', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)/r3productivityratio  as 'r3',
       r3.constituentItem as 'r4i',r4.craftingname 'r4c',  r4.recipe  as 'r4r', ceil(((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)  as 'r4',
       r4.constituentItem as 'r5i',r5.craftingname 'r5c',  r5.recipe  as 'r5r', ceil((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)  as 'r5',
       r5.constituentItem as 'r6i',r6.craftingname 'r6c',  r6.recipe  as 'r6r', ceil(((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)  as 'r6',
       r6.constituentItem as 'r7i',r7.craftingname 'r7c',  r7.recipe as 'r7r', ceil((((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)*r6.constituentAPS/r7.amountPerSecond)  as 'r7'  
            
from (select 1+1.6 as r1productivityratio),
     (select 1+1.8 as r2productivityratio),
     (select 1 as r3productivityratio),
(select * from recipeTarget where recipe = 'rocket-part' and craftingName = 'Rocket Silo' and targetName = '10 per Second') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Advanced Chemical Plant MK2 with 24 Raw Speed Modules' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Row 8 Assembling machine 6 w 4x raw speed 8 Beacon' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 6 w 6 raw speed 8' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 6 w 6 raw speed 8' and targetName = '1 per Second') r5 on (r4.constituentItem = r5.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 6 w 6 raw speed 8' and targetName = '1 per Second') r6 on (r5.constituentItem = r6.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Assembling machine 6 w 6 raw speed 8' and targetName = '1 per Second') r7 on (r6.constituentItem = r7.item)

where r2.recipe  IN ('rocket-fuel')
-- and r3.recipe IN ('lead-ore-smelting', 'tin-ore-smelting')
--where r3.recipe  IN ('gas-ammonia')

-- and r3.item not in ('diamond-3', 'water', 'steel-plate')
-- and r4.recipe not in ('ye_fish2_recipe', 'y_ft_recipe')
-- and r4.item not in ('gas-hydrogen', 'gas-carbon-dioxide', 'water', 'water-purified')
-- and r5.item not in ('water-purified')
--and r5.recipe in ('gas-methanol-from-wood')
--and r7.item in ('raw-wood')
-- and r5.recipe not in ('construction-robot', 'flying-robot-frame-2','robot-brain-construction-2')
--and r6.recipe in ('robot-tool-construction')
-- and r2.recipe not like 'y%'
-- and r3.recipe not like 'y%'
-- and r4.recipe not like 'y%'
--and r5.recipe not like 'y%'
--and r6.recipe not like 'y%'

)
order by coalesce(r1,0)+coalesce(r2,0)+coalesce(r3,0)+coalesce(r4,0)+coalesce(r5,0)+coalesce(r6,0)+coalesce(r7,0) desc
limit 20
;


--Electronics assembling machine 3 w 6 raw speed 8
/*

from (select * from recipeTarget where recipe = 'angels-plate-zinc' and craftingName = 'C1 with 3 Speed 1' and targetName = 'Yellow Belt 1 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'C1 with 3 Speed 1' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'C1 with 3 Speed 1' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'C1 with 3 Speed 1' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'C1 with 3 Speed 1' and targetName = '1 per Second') r5 on (r4.constituentItem = r5.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Blast Furnace MK1' and targetName = '1 per Second') r6 on (r5.constituentItem = r6.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = '' and targetName = '1 per Second') r7 on (r6.constituentItem = r7.item)

*//*

select printf('For %s %s, producing %s per second, using %s machines,
   %i %s: %s (%s)
<- %i %s: %s (%s)
<- %i %s: %s (%s)
<- %i %s: %s (%s)
  ', r1i, targetName,  targetAmount, coalesce(r1,0)+coalesce(r2,0)+coalesce(r3,0)
   , r1, r1c, r1i, r1r
   , r2, r2c, r2i, r2r
   , r3, r3c, r3i, r3r
   )
FROM (
select distinct r1.targetName, r1.targetAmount, r1.item 'r1i',  r1.craftingname 'r1c', r1.recipe as 'r1r',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i',r2.craftingname 'r2c', r2.recipe as 'r2r', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i',r3.craftingname 'r3c',  r3.recipe as 'r3r', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3'
            
from (select * from recipeTarget where recipe = 'electronic-circuit' and craftingName = 'Electronics assembling machine 3 w 6 raw speed 8' and targetName = 'Purple Belt 2 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Electronics assembling machine 3 w 6 raw speed 8' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Electronics assembling machine 3 w 6 raw speed 8' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
where r2.recipe IN ('basic-circuit-board', 'basic-electronic-components')
-- and r3.recipe IN ('angels-roll-steel-converting', 'battery', 'basic-electronic-circuit')

)
order by coalesce(r1,0)+coalesce(r2,0)+coalesce(r3,0) desc
limit 2
;/**/


SELECT printf('Episode:        %s
Episode Name:   %s
Episode Desc:   %s
Session count:  %s', episodeID, episodeName, description, session)
  from episode,      
      (select count(*) session from episode where uploaddate is null)

 order by episodeid desc 
 limit 1;


select case count(*)-1-max(episodeid) when 0 then '' else 'Episode Num mismatch' END from episode;
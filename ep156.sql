.header off
.header off
select 'Salvite sodales and Hello Youtube!';


REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
              VALUES('156',     
                     'Crystal Recycling Improvements' ,
                     'Using our newly available aluminium to upgrade recycling');


-- /c remote.call('LTN','log_level', 2)s

--select episodeid from episode;
  










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
select r1.targetName, r1.targetAmount, r1.item 'r1i',  r1.craftingname 'r1c', r1.recipe as 'r1r',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i',r2.craftingname 'r2c', r2.recipe as 'r2r', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i',r3.craftingname 'r3c',  r3.recipe as 'r3r', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3',
       r3.constituentItem as 'r4i',r4.craftingname 'r4c',  r4.recipe  as 'r4r', ceil(((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)  as 'r4',
       r4.constituentItem as 'r5i',r5.craftingname 'r5c',  r5.recipe  as 'r5r', ceil((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)  as 'r5',
       r5.constituentItem as 'r6i',r6.craftingname 'r6c',  r6.recipe  as 'r6r', ceil(((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)  as 'r6',
       r6.constituentItem as 'r7i',r7.craftingname 'r7c',  r7.recipe as 'r7r', ceil((((((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)*r3.constituentAPS/r4.amountPerSecond)*r4.constituentAPS/r5.amountPerSecond)*r5.constituentAPS/r6.amountPerSecond)*r6.constituentAPS/r7.amountPerSecond)  as 'r7'  
            
from (select * from recipeTarget where recipe = 'angels-plate-copper' and craftingName = 'Casting Machine MK3' and targetName = 'Red Belt 2 side') r1
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Induction Furance MK3' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Blast Furnace MK3' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Blast Furnace MK2' and targetName = '1 per Second') r4 on (r3.constituentItem = r4.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Powder Mixer MK2' and targetName = '1 per Second') r5 on (r4.constituentItem = r5.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = 'Blast Furnace MK1' and targetName = '1 per Second') r6 on (r5.constituentItem = r6.item)
LEFT OUTER JOIN (select * from recipeTarget where craftingName = '' and targetName = '1 per Second') r7 on (r6.constituentItem = r7.item)
where r2.recipe IN ('molten-copper-smelting')
and r3.recipe in ('copper-ore-smelting')
--and r4.recipe in ('solid-aluminium-hydroxide-smelting')
--and r5.recipe in ('bauxite-ore-smelting')
--where r2.recipe not like 'y%'
and r3.recipe not like 'y%'
)
order by coalesce(r1,0)+coalesce(r2,0)+coalesce(r3,0)+coalesce(r4,0)+coalesce(r5,0)+coalesce(r6,0)+coalesce(r7,0) desc

;

/*


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
select r1.targetName, r1.targetAmount, r1.item 'r1i',  r1.craftingname 'r1c', r1.recipe as 'r1r',  r1.numCraftingMachines as 'r1', 
       r1.constituentItem as 'r2i',r2.craftingname 'r2c', r2.recipe as 'r2r', ceil(r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)  as 'r2',
       r2.constituentItem as 'r3i',r3.craftingname 'r3c',  r3.recipe as 'r3r', ceil((r1.numCraftingMachines*r1.constituentAPS/r2.amountPerSecond)*r2.constituentAPS/r3.amountPerSecond)  as 'r3'
            
from (select * from recipeTarget where item = 'iron-gear-wheel'  and craftingName = 'Assembling machine 3' and targetName = 'Red Belt 2 side') r1
LEFT OUTER JOIN (select * from recipeTarget where recipe not like 'Assembling machine 3' and craftingName = 'Induction Furance MK2' and targetName = '1 per Second') r2 on (r1.constituentItem = r2.item)
LEFT OUTER JOIN (select * from recipeTarget where recipe not like 'Assembling machine 3' and craftingName = 'Blast Furance MK2' and targetName = '1 per Second') r3 on (r2.constituentItem = r3.item)


)
order by coalesce(r1,0)+coalesce(r2,0)+coalesce(r3,0) desc

;
*/

SELECT printf('Episode:        %s
Episode Name:   %s
Episode Desc:   %s
Session count:  %s', episodeID, episodeName, description, session)
  from episode,      
      (select count(*) session from episode where uploaddate is null)

 order by episodeid desc 
 limit 1;


select case count(*)-1-max(episodeid) when 0 then '' else 'Episode Num mismatch' END from episode;
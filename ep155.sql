.header off
.header off
select 'Salvite sodales and Hello Youtube!';


REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
              VALUES('155',     
                     'Logistic Train - Train Loading Latch' ,
                     'Showing off a resetting memory cell based belt counter and latch. It uses a decider combinator as memory cell and completely does away with needing an RS-Latch. But I''ll explain how I got to this point and some basic facotrio circuitry stuff. Blueprint follows

Anticlockwise Train Loading Latch
H4sIAAAAAAAA/+1YwW7bOBD9FUPXlQqbltMWWS0Q7HGLPSx6KxYCLY4tYmVSIKm0hqF/3yEl25HM2LTQnpIckticN+S8eTMSh8lZJQtazfLswAspdHY4cMHg
R7aINd8KWmUHs68hi7iBXRQLusP/FeVV1LZxb0qumH6nCkrZaEjWVPMCUW0MwnDDwe7VGWmDHrelSZzjuJYa16XIDj+y5CHe4682ZlxB4b4luPFtXDoRR6bh
5tNgE3ebGNw1Lq110uVxxMjHDyuLSz+sXiIfTsgN1SapJGWgRshVj2zjXhiibkwUAFxOBaZTgeQ6sLKMAkt2wHizS6BCFhQvklpWMPK06DxhCO0JzqDguGdS
yN2aC2rkePt5D2pjLEKjZJWvoaTPXKrs0INzXGEOgYWz4UqbfFh2z1yZxmav14FbTLYKQETOrzZUGFQqnqKmyp4ii7Iolo3BWIOcwTOovSm52DqP9R4P1QiT
b5Tc5Y6yzKgGWred6JSCp/0WLaJ/s4M7Cha9q/99zlm2SOOCq6Lhxn6yYjyvkYfBx+VyaIp7fIuIdauADZySj7h2a69Fa39O6ZVbrg3m09aOSLSRddLRMiog
bykQT9I2vDKgbIsLTNLeMYpkYuftO3AbzuOnm+F0gvZFY5XqieBI1kl296iOihcy8QrvD1zCxwK6ryTy5GTjjXac3tuxeppe6m96x7Je8+21mv50rs3bxxvJ
9sEvxtWF1YuYXC8uShePpyMHNWSkQ+haKpOsoTL+xkx+QeZv9pv2VIYg6LqCnHFt/zoJnNYUUJaXVDB7CoNM6eH68dvOcCcZZPOwBJGVNyP26xcpCOZw8Qs4
HLRZDdZHEO7J8X4m+/fpZG9opX8K28TPNrmT7fSd7RC2F8NH6NJP/qXVXblYvuciTPnx7bcSj9WUXLzVTj56YXylsY+tpnSet8lwOuRu7md4PrRK72SYvG2G
vZQOib92dwnm971fX39xv3YXfeVBuhy+xZPxFbUNmDx075Hz4+Chv3YGD0kmANOpQHIdSBU35Q7sZey1Qcf86OFSh2f0xEkH0KIclrqsAfVlt45+u2vO8RSF
372Hg4nF5b3uOKfw6Gf4tA+cEnnZmzgk+vL172TPVV7JQuYMqvyvf37WrOjcen1jIle14RyTcf97ndSbvdIr7c9ILBmPdbyjwPFEe1TN6CcNazijS3/4iLGb
MB4flyEDk4Em/fffsdUF4/aovWj6kYuefbUzl9kXaopy9oTY5E8U0n/fuYaofVRgGiVm+SMI9j8pogitaBgAAA==


Clockwise Train Loading Latch
H4sIAAAAAAAA/+1ZS2/bOBD+K4aulQLrZTtItcCixwZ7KHorCoEWxzZRihRIKltD8H8vKdlJGNG2JCSnOpfYmRfnm5lvGAnzGeUForM8a0jBmcyahjAMv7PQ
l2TLEM0ata8g84iC0vMZKvVngQj1DoeDD0wRRcBYdRJKtjsFOFiTbQAUCiVIEVScgudXXGpdzrLmdxas/H0WxAdfh2Rai7SRf3ih9zNrBGDtr3W9zwnOkoP5
8ZuX2EF3tDc+l3ep8RrepQcfE9G5zaJnS8q3RCp9HqV9sEAqXgW8VlWt3jhaOB0tzGGV4DRfww49ES6yZkOoAmHSt8F6IkLV5oBd5E4YbAXsPZNzzZTG94iz
yW0IDOHCwsGVDWFnk4lMMv0ECiKKmqhcS/DRZkOEVPmQfBDbqx1h2zYnJhXSac31x7JCAint3vtHi2oJ2j3lGiYlahiY7LVc32bZ5miV63rHXGsYacLpfg7a
fu838Hy82WKaWTLNLJpkNp9kNS3WtMSmoXihZCfaKgGTurzMXG3ThMdxutrImuNefYtsLkOCqF0JprP11KwJM1PzJl7YxrNaO3EM8ourl1mWY4YZULGzB5lX
oMfYBPQ+eX7HlINc/esN5bQWD/+HFxmhpkdgtnhlwYWhIBjEeazmw7A6+hkL1OP3/4I9EblemDzHQPOv384zXzYKsTb11lm1z9v9kG8EL/OW0LMNohKmINoT
pv6J8Hscu0FSBZQjDYyN6nMDHu8B7Y65bhZNM0ummcXTzNKLZiNYocs2GcoK4cKihXBp18WSrc7LouWU+Ug+aD56vfwOgwFPIF5dMlzT0V4qBsJuYRlpKwfn
pLZOD++zw7Ua4M8xc3phMVlxoYI1UOUaouQ9726jWMzc305hgKE1hRwTaX63sD/LBCCc7xDD5jBKJy9t+emvnWLJMZhNPIjPllYF4tANcl9rDMzhDeZF754y
oJd928MEzOMP+LfE4gwJxsfQa4tVlc/Tq9Ju7PcoyyUyunfWyN4lfZPx9HOr0eUarWzuObNW+lpjKpH89QwV23QTuxnKoTUG5vgG87zH6q5utteFNpoA841X
LvPKvY1x7K5EX2s8r9wqcXkm7C0ap27q6WuNqUR6o565G9eR5JLeWnoA1vZzydhN8w6t10/lBz8eWVoluX64MwPWTdTh1N3HlwJy9t28FZg9IlXsZl90s//6
n0jwDg8CVC3YLH8Ahv8AhDdQPOkaAAA=



                     ');


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
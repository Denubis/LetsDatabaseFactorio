drop table craftingMachine;
DROP TABLE outputTarget;
drop view if exists greyRecipe;
drop view if exists greyRecipePerSecond;
drop view if exists greyRecipeTarget;




CREATE TABLE craftingMachine (   CraftingName TEXT PRIMARY KEY,
craftingSpeed REAL

);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('171.5',171.5);

INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('238.7',238.7);

INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('49.5',49.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('37.1',37.1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('92.7',92.7);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('202.5',202.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('300.3',300.3);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('317.1',317.1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('175.7',175.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('386.5',386.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('227.5',227.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('266.7',266.7);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Rocket Silo',3);

INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Advanced Chemical Plant MK2 with 24 Raw Speed Modules',98.5);

  
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Angels MK4 w 2 Raw Speed 2',5.4);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Angels MK4 w 2 Raw Speed 8',12.6);

INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 1',0.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 2',0.75);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 3 w 4 speed 1',1.875);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 3',1.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 5 w 5 raw speed 2',8.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 6 w 6 raw speed 2',11.9);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 6 w 6 raw speed 8',37.1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Row 8 Assembling machine 6 w 4x raw speed 8 Beacon',112.7);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Blast Furnace MK1',1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Blast Furnace MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Blast Furnace MK3',2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('C1 with 3 Speed 1',2.75);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Casting Machine MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Casting Machine MK3 w 2 Speed Module',2.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Casting Machine MK3',2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical Furnace MK3', 2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical Plant MK3 w 5 Raw Speed 2', 8.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical Plant MK3 w 5 Raw Speed 2 and 4 beacon raw speed 2', 11.55);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical Plant MK2', 2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical Plant',1.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Crystalizer Mk2 with 2 Raw Speed 2',4.05);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electric Chemical Furnace w 3 Raw Speed 2', 4.4);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electric Multi-Purpose w 5 Raw Speed 2',9);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electrolyser MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 1',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 2',2.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 3 w 6 Speed 1',7);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 3',4);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 3 w 6 Raw speed 2',13.6);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Hydro Plant',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Induction Furance MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Induction Furance MK3',2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Liquifier',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Metal mixing furance',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Mk1 Smeltery',0.75);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Crusher Mk 2',2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Crusher Mk 3 with 3 Raw Speed 3',6.6);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Crusher',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Processing Machine MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Processing Machine MK4',3);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Sorting Facility MK4 w 4 Raw Speed 8',11.6);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Sorting Facility MK4 w 4 Raw Speed 8 and Beacon 4 Raw Speed 8',21.2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Pellet Press MK1',1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Powder Mixer MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Steam Cracker',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Steel furnace',2.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Stone Furnace',1.0);



CREATE TABLE outputTarget (
  targetName TEXT PRIMARY KEY,
  targetAmount REAL
);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('10 per Second',10.0);

INSERT INTO outputTarget(targetName,targetAmount) VALUES('1 per Second',1.0);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Molten Copper',6.66666666666667);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Copper Ingot',8.0);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Furnace Column',20.5714285714286);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Yellow Belt 1 side',6.66666666666667);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Red Belt 1 side',13.3333333333333);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Red Belt 2 side',26.6666666666667);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Purple Belt 2 side',26.6666666666667*2);


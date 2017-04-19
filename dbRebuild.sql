drop table craftingMachine;
DROP TABLE outputTarget;
drop view if exists greyRecipe;
drop view if exists greyRecipePerSecond;
drop view if exists greyRecipeTarget;




CREATE TABLE craftingMachine (   CraftingName TEXT PRIMARY KEY,
craftingSpeed REAL

);



INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 1',0.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 2',0.75);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Assembling machine 3',1.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Blast Furnace MK1',1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Blast Furnace MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Casting Machine MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical Plant',1.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Chemical plant',1.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electrolyser MK2',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 1',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Electronics assembling machine 2',2.25);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Hydro Plant',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Induction Furance MK2',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Liquifier',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Metal mixing furance',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Mk1 Smeltery',0.75);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Crusher',1.5);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Crusher Mk 2',2);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Ore Processing Machine MK2',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Pellet Press MK1',1);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Steam Cracker',1.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Steel furnace',2.0);
INSERT INTO craftingMachine(CraftingName,craftingSpeed) VALUES('Stone Furnace',1.0);



CREATE TABLE outputTarget (
  targetName TEXT PRIMARY KEY,
  targetAmount REAL
);

INSERT INTO outputTarget(targetName,targetAmount) VALUES('1 per Second',1.0);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Molten Copper',6.66666666666667);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Copper Ingot',8.0);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Furnace Column',20.5714285714286);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Yellow Belt 1 side',6.66666666666667);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Red Belt 1 side',13.3333333333333);
INSERT INTO outputTarget(targetName,targetAmount) VALUES('Red Belt 2 side',26.6666666666667);


DROP TABLE item;

CREATE TABLE item(
  item TEXT PRIMARY KEY,
  i18n TEXT
);

.read item.sql

DROP TABLE if exists recipeComponent;
DROP TABLE if exists recipeProduct;
DROP TABLE recipe;


CREATE TABLE recipe(
  recipe        TEXT PRIMARY KEY,  
  craftingSpeed REAL
);

begin;
.read recipe.sql
commit;

CREATE TABLE recipeProduct(
  recipe  TEXT REFERENCES recipe,
  item    TEXT REFERENCES item, 
  amount  REAL,
  PRIMARY KEY (recipe, item)
);

begin;
.read product.sql
commit;

CREATE TABLE recipeComponent(
  recipe  TEXT REFERENCES recipe,
  constituentItem REFERENCES item (item),
  constituentItemAmount REAL,
  PRIMARY KEY (recipe, constituentItem)
);
begin;
.read ingredient.sql
commit;

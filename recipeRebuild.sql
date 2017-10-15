
DROP TABLE item;

CREATE TABLE item(
  item TEXT PRIMARY KEY,
  i18n TEXT
);

.read item.sql

DROP TABLE if exists recipeComponent;
DROP TABLE if exists recipeProduct;
DROP TABLE recipe;


CREATE TABLE  recipe(
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

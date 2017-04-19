import json
import re
import string

item=set()
recipeOut = []
ingredientOut = []
productOut = []



with open("recipes.json") as recipesJson:
	recipes = json.load(recipesJson)

	for recipe in recipes:
		#print(recipes[recipe])
		recipeOut.append("INSERT INTO RECIPE(recipe, craftingSpeed) VALUES('%s',%s);" % (recipe, recipes[recipe]['energy']))
		for ingredient in recipes[recipe]['ingredients']:
			ingredientOut.append("INSERT INTO recipeComponent(recipe, constituentItem, constituentItemAmount) VALUES('%s', '%s', %s);" % (recipe, ingredient['name'], ingredient['amount']))

		for product in recipes[recipe]['products']:
			amount = 0
			if 'amount_min' in product and 'amount_max' in product:
				amount= (product['amount_max']-product['amount_min'])/2+product['amount_min']
			if 'amount' in product:
				amount= product['amount'] 
			if 'probability' in product:
				amount = amount*product['probability']

			item.add(product['name'])


			#print(recipe, product['name'], amount, recipes[recipe]['energy'])			
			

			productOut.append("INSERT INTO recipeProduct(recipe, item, amount) VALUES('%s', '%s', %s);" % (recipe, product['name'], amount))

with open('item.sql', 'w') as file:
	for i in item:
		file.write("INSERT INTO item(item, i18n) VALUES('%s', '%s');\n" % (i, re.sub(r'[-_]',' ',i).title()))

with open('recipe.sql', 'w') as file:
	for i in recipeOut:
		file.write("%s\n" % (i))


with open('ingredient.sql', 'w') as file:
	for i in ingredientOut:
		file.write("%s\n" % (i))		


with open('product.sql', 'w') as file:
	for i in productOut:
		file.write("%s\n" % (i))				
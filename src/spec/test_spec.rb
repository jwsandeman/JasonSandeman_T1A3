require_relative '../recipes.rb'
require_relative '../individual_recipe.rb'

describe "Test IndividualRecipe object" do
    it "should store the attributes of IndividualRecipe correctly" do
        name = "Roast Chicken"
        ingredients = {
            "1.5kg whole chicken" => false,
            "¼ cup melted butter" => true,
            "3 fresh whole rosemary sprigs" => true
        }
        instructions = [
            "Preheat air fryer to 180C, for 4 minutes.",
            "Pat the chicken dry with paper towel.",
            "Brush completely with butter.",
            "Season with sea salt and cracked pepper and lots of lovely fresh rosemary.",
            "Place chicken into air fryer basket.",
            "Cook at 180ºC, for 50-60 minutes.",
            "Let the roast chicken rest for a few minutes before removing carefully with tongs."
            ]
        serves = 4
        individual_recipe = IndividualRecipe.new(name, ingredients, instructions, serves)
        expect(individual_recipe.name).to eq(name)
        expect(individual_recipe.ingredients["1.5kg whole chicken"]).to eq(false)
        expect(individual_recipe.instructions.length).to eq(7)
        expect(individual_recipe.serves).to eq(serves)
    end
end

describe "Test Recipe object" do
    it "should store the attributes of Recipe correctly" do
        individual_recipe = [IndividualRecipe.new(
            "Roast Chicken",
            {
            "1.5kg whole chicken" => false,
            "¼ cup melted butter" => true,
            "3 fresh whole rosemary sprigs" => false
            },
            [
            "Preheat air fryer to 180C, for 4 minutes.",
            "Pat the chicken dry with paper towel.",
            "Brush completely with butter.",
            "Season with sea salt and cracked pepper and lots of lovely fresh rosemary.",
            "Place chicken into air fryer basket.",
            "Cook at 180ºC, for 50-60 minutes.",
            "Let the roast chicken rest for a few minutes before removing carefully with tongs."
            ],
            4),
            IndividualRecipe.new(
            "Vegetarian Nachos Pies", 
            {
            "400g can mixed beans drained" => false,
            "1 cup grated cheddar cheese" => false,
            "⅓ cup chopped shallots" => false,
            "1 medium red capsicum finely chopped" => false,
            "2 sheets puff pastry" => false,
            "1 handful tortilla chips" => false,
            "2 tbsp chopped coriander" => false,
            "8 jalapeños chopped" => false
            },
            [
            "Mix beans, cheese,shallots and capsicum in a bowl.",
            "Set aside.",
            "Pre-heat Pie Maker.",
            "Cut out 12 pie bases.",
            "Line the pie holes with pastry.",
            "Crush a few tortilla chips in each base then fill with the beans mixture.",
            "Sprinkle with coriander and a few jalapeños; use more if you like it spicy.",
            "Close and cook for 15minutes.",
            "Remove pies and cool slightly.",
            "Serve with more crushed tortillas and a dollop of salsa and sour cream or your Guacamole."
            ],
            8)]
        recipes = Recipes.new(individual_recipe)
        expect(recipes.individual_recipe.length).to be > 0
        expect(recipes.individual_recipe.length).to eq 2
        expect(recipes.individual_recipe[0].ingredients["¼ cup melted butter"]).to eq(true)
        expect(recipes.individual_recipe[1].ingredients["⅓ cup chopped shallots"]=true).to eq(true)
        expect(recipes.individual_recipe[1].serves).to eq(8)
    end
end

describe "Test find ingredient" do
    it "finds an ingredient in the array" do
        individual_recipe = [IndividualRecipe.new(
            "Roast Chicken",
            {
            "1.5kg whole chicken" => false,
            "¼ cup melted butter" => true,
            "3 fresh whole rosemary sprigs" => false
            },
            [
            "Preheat air fryer to 180C, for 4 minutes.",
            "Pat the chicken dry with paper towel.",
            "Brush completely with butter.",
            "Season with sea salt and cracked pepper and lots of lovely fresh rosemary.",
            "Place chicken into air fryer basket.",
            "Cook at 180ºC, for 50-60 minutes.",
            "Let the roast chicken rest for a few minutes before removing carefully with tongs."
            ],
            4),
            IndividualRecipe.new(
            "Vegetarian Nachos Pies", 
            {
            "400g can mixed beans drained" => false,
            "1 cup grated cheddar cheese" => false,
            "⅓ cup chopped shallots" => false,
            "1 medium red capsicum finely chopped" => false,
            "2 sheets puff pastry" => false,
            "1 handful tortilla chips" => false,
            "2 tbsp chopped coriander" => false,
            "8 jalapeños chopped" => false
            },
            [
            "Mix beans, cheese,shallots and capsicum in a bowl.",
            "Set aside.",
            "Pre-heat Pie Maker.",
            "Cut out 12 pie bases.",
            "Line the pie holes with pastry.",
            "Crush a few tortilla chips in each base then fill with the beans mixture.",
            "Sprinkle with coriander and a few jalapeños; use more if you like it spicy.",
            "Close and cook for 15minutes.",
            "Remove pies and cool slightly.",
            "Serve with more crushed tortillas and a dollop of salsa and sour cream or your Guacamole."
            ],
            8)]
        recipes = Recipes.new(individual_recipe)
        index = recipes.find_ingredient("1.5kg whole chicken")
        expect(index).to eq 1

    end

    # it "doesn't find a menu item in the array"  do
    #     menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
    #     menu = Menu.new(menu_items)
    #     expect(menu.find_item("Espresso")).to eq -1
    # end
end

# name, ingredients, instructions, serves
# "Roast Chicken", 
# ["1.5kg whole chicken", "¼ cup melted butter", "3 fresh whole rosemary sprigs"],
# [
# "Preheat air fryer to 180ºC, for 4 minutes."
# "Pat the chicken dry with paper towel."
# "Brush completely with butter."
# "Season with sea salt and cracked pepper and lots of lovely fresh rosemary."
# "Place chicken into air fryer basket."
# "Cook at 180ºC, for 50-60 minutes."
# "Let the roast chicken rest for a few minutes before removing carefully with tongs."
# ],
# 4)]
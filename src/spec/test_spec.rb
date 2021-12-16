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

describe "Test selected_recipes" do
    it "returns an array of selected recipes" do
        individual_recipe = [IndividualRecipe.new(
            "Roast Chicken",
            {
            "1.5kg whole chicken" => true,
            "¼ cup melted butter" => true,
            "3 fresh whole rosemary sprigs" => true
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
        # This test was performed when i had "if i.selected_recipe == false" and passed.
        # expect(recipes.selected_recipes).to eq(["Roast Chicken", "Vegetarian Nachos Pies"])
        expect(recipes.selected_recipes).to eq([])
    end
end

describe "Test selected_recipes" do
    it "returns an array of ingredients" do
        individual_recipe = [IndividualRecipe.new(
            "Roast Chicken",
            {
            "1.5kg whole chicken" => true,
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
        recipes.individual_recipe[0].selected_recipe = true
        recipes.individual_recipe[1].selected_recipe = true
        expect(recipes.selected_recipes).to eq([{"1.5kg whole chicken"=>true, "3 fresh whole rosemary sprigs"=>false, "¼ cup melted butter"=>true}, {"1 cup grated cheddar cheese"=>false, "1 handful tortilla chips"=>false, "1 medium red capsicum finely chopped"=>false, "2 sheets puff pastry"=>false, "2 tbsp chopped coriander"=>false, "400g can mixed beans drained"=>false, "8 jalapeños chopped"=>false, "⅓ cup chopped shallots"=>false}])
    end
end

describe "Test display_missing_ingredients" do
    it "returns an array of missing ingredients for the shopping list" do
        individual_recipe = [IndividualRecipe.new(
            "Roast Chicken",
            {
            "1.5kg whole chicken" => true,
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
        recipes.individual_recipe[0].selected_recipe = true
        recipes.individual_recipe[1].selected_recipe = true
        new_ingredients = []
        new_ingredients = recipes.selected_recipes
        expect(recipes.display_missing_ingredients(new_ingredients)).to eq([{"3 fresh whole rosemary sprigs"=>false}, {"1 cup grated cheddar cheese"=>false, "1 handful tortilla chips"=>false, "1 medium red capsicum finely chopped"=>false, "2 sheets puff pastry"=>false, "2 tbsp chopped coriander"=>false, "400g can mixed beans drained"=>false, "8 jalapeños chopped"=>false, "⅓ cup chopped shallots"=>false}])
    end
end

describe "Test ingredient_select class function" do
    it "returns updated value" do
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
            "⅓ cup chopped shallots" => true,
            "1 medium red capsicum finely chopped" => false,
            "2 sheets puff pastry" => false,
            "1 handful tortilla chips" => true,
            "2 tbsp chopped coriander" => false,
            "8 jalapeños chopped" => true
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
        ingredient = "1.5kg whole chicken"
        recipes = Recipes.new(individual_recipe)
        # this test worked when testing "return ingredient"
        # expect(recipes.ingredient_select(ingredient)).to eq("1.5kg whole chicken")
        # this test worked when testing "return index"
        # expect(recipes.ingredient_select(ingredient)).to eq(0)
        # this test worked when testing "return item.ingredients[ingredient]"
        # expect(recipes.ingredient_select(ingredient)).to eq(true)
    end
end

describe "Test testing_string function" do
    it "returns updated value" do
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
            "⅓ cup chopped shallots" => true,
            "1 medium red capsicum finely chopped" => false,
            "2 sheets puff pastry" => false,
            "1 handful tortilla chips" => true,
            "2 tbsp chopped coriander" => false,
            "8 jalapeños chopped" => true
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
        name1 = recipes.individual_recipe[0].to_s
        name2 = recipes.individual_recipe[1]
        name3 = "Roast Chicken (you have 6/3 ingredients)"
        expect(name1).to eq("Roast Chicken (you have 0/3 ingredients)")
        expect(recipes.testing_string(name3)).to eq(true)
    end
end

describe "Test selected_ingredients" do
    it "returns an integer of the total ingredients selected by the user in the recipe" do
        individual_recipe = [IndividualRecipe.new(
            "Roast Chicken",
            {
            "1.5kg whole chicken" => true,
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
            "⅓ cup chopped shallots" => true,
            "1 medium red capsicum finely chopped" => false,
            "2 sheets puff pastry" => false,
            "1 handful tortilla chips" => true,
            "2 tbsp chopped coriander" => false,
            "8 jalapeños chopped" => true
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
        expect(recipes.individual_recipe[1].selected_ingredients).to eq(3)
    end
end
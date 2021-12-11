require_relative "./recipes.rb"
require_relative "./individual_recipe.rb"

def seed
    recipes = Recipes.new(
        [IndividualRecipe.new(
            "Roast Chicken", 
            [
            {"1.5kg whole chicken" => false},
            {"¼ cup melted butter" => false},
            {"3 fresh whole rosemary sprigs" => false}
            ],
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
            [
            {"400g can mixed beans drained" => false},
            {"1 cup grated cheddar cheese" => false},
            {"⅓ cup chopped shallots" => false},
            {"1 medium red capsicum finely chopped" => false},
            {"2 sheets puff pastry" => false},
            {"1 handful tortilla chips" => false},
            {"2 tbsp chopped coriander" => false},
            {"8 jalapeños chopped" => false}
            ],
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
            8),
            IndividualRecipe.new(
            "Fish Pie", 
            [
            {"800g frozen mixed vegetables thawed" => false},
            {"2 tbsp plain flour" => false},
            {"400g skinless smoked cod, trout or salmon 3cm pieces" => false},
            {"1½ cups fish stock" => false},
            {"3 sheets puff pastry" => false}
            ],
            [
            "In a non-stick frying pan over medium heat, sauté the veggies for 8 minutes or until soft and starting to brown.",
            "Sprinkle over flour and stir cooking for 1 minute or until well coated.",
            "Add the stock and fish and stir until well combined.",
            "Reduce heat and simmer for 10 minutes.",
            "Season to taste.",
            "Cut 8 bases and 8 lids from the pastry sheets (using leftover pastry, join together, then roll out flat and thin).",
            "Press the first 4 bases into the pie holes.",
            "Pour the mixture into each base.",
            "Top with a lid, close and cook for 8 minutes, or until the crust is golden brown and crunchy.",
            "Carefully remove and repeat."
            ],
            8),
            IndividualRecipe.new(
            "Italian Meatballs", 
            [
            {"500g beef mince" => false},
            {"1 egg" => false},
            {"¼ cup basil pesto plus extra to serve" => false},
            {"500g jar pasta sauce" => false}
            ],
            [
            "Combine mince, egg and basil pesto.",
            "Season then form in to 6cm meatballs.",
            "In a non-stick frying pan over medium heat, add the meatballs and cook, turning, for 6 to 7 minutes until browned all over.",
            "Reduce heat and add the pasta sauce.",
            "Season and simmer for 10 to 15 minutes."
            ],
            4),
            IndividualRecipe.new(
            "Mediterranean Rosemary Skewers", 
            [
            {"8 fresh rosemary stalks 25cm long" => false},
            {"4 medium lamb chops or steak" => false},
            {"4 cloves garlic crushed" => false},
            {"3 tablespoons fresh lemon juice and zest" => false}
            ],
            [
            "Remove the bottom two-thirds of rosemary leaves from each stalk and cut a sharp point into the end.",
            "Cut the lamb into chunks, then in a large bowl, combine lamb, garlic, lemon juice and zest with 2 tbsp. chopped rosemary leaves.",
            "Marinate the lamb in this mixture for at least 2 hours.",
            "Thread onto rosemary skewers (add whatever vegetables you like).",
            "Grill over a medium high heat for 8 to 10 minutes turning occasionally until cooked to desired tenderness."
            ],
            4)
        ]
    )
end 


# name, ingredients, instructions, serves
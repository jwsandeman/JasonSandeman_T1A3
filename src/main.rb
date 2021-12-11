require_relative "./seed.rb"
require "tty-prompt"

recipes = seed
$prompt = TTY::Prompt.new

# -----------------------------------------------------------------------------------------------------
# MENUS
# -----------------------------------------------------------------------------------------------------
def main_menu
    answer = $prompt.select("Please choose from the menu options below", ["Select Ingredients", "Matching Recipes", "My Recipes", "Shopping List", "Exit"])
    return answer
end

def select_ingredient_sub_menu
    answer = $prompt.select("Would you like to add or remove an ingredient from your list?", ["Add Ingredients", "Remove Ingredients","Go Back"])
    return answer  
end

def recipe_sub_menu
    answer = $prompt.select("Would you like to add or remove a recipe from your list?", ["Add Recipe", "Remove Recipe","Go Back"])
    return answer  
end

def display_ingredients_sub_menu(recipes)
    answer = $prompt.select("What ingredients do you currently have at home? Press enter on an ingredient to add it to your list. You can add as many ingredients as you like", [recipes.display_ingredients, "Finished Adding Ingredients"])
    return answer  
end

def display_user_ingredients_sub_menu(user_ingredients)
    answer = $prompt.select("What ingredients do you currently have at home? Press enter on an ingredient to add it to your list. You can add as many ingredients as you like", [user_ingredients, "Finished Adding Ingredients"])
    return answer  
end

# -----------------------------------------------------------------------------------------------------
# SELECT INGREDIENTS FEATURE
# -----------------------------------------------------------------------------------------------------
def add_ingredients(ingredient, user_ingredients)
    system "clear"
    if user_ingredients.find {|i| i == ingredient}
        puts "You have already added that ingredient, please choose a different ingredient"
    else
        user_ingredients.push(ingredient)
    end
    puts user_ingredients
    # recipes.individual_recipe[0].ingredients[ingredient]= false
    # puts recipes.individual_recipe[0].ingredients[ingredient]
end

def remove_ingredients(ingredient, user_ingredients)
    system "clear"
    user_ingredients.delete(ingredient)
    puts user_ingredients
end

# -----------------------------------------------------------------------------------------------------
# MATCHING RECIPES FEATURE
# -----------------------------------------------------------------------------------------------------
def matching_recipes
    
end

# -----------------------------------------------------------------------------------------------------
# MY INGREDIENTS FEATURE
# -----------------------------------------------------------------------------------------------------
def my_ingredients
    
end

# -----------------------------------------------------------------------------------------------------
# SHOPPING LIST FEATURE
# -----------------------------------------------------------------------------------------------------
def shopping_list
    
end

# -----------------------------------------------------------------------------------------------------
# WELCOME SCREEN AND MAIN MENU LOGIC
# -----------------------------------------------------------------------------------------------------
system "clear"
# puts "Welcome to your personalised Recipe Suggestion Application! What is your Name?"
# name = gets.chomp
# puts "Thanks #{name}, now let's find some recipes to cook!"
option = ""
user_ingredients = []
while option != "Exit"
    option = main_menu
    case option
        when "Select Ingredients"
            add_remove_option = ""
            while add_remove_option != "Go Back"
                add_remove_option = select_ingredient_sub_menu
                case add_remove_option
                    when "Add Ingredients"
                        ingredient = display_ingredients_sub_menu(recipes)
                        add_ingredients(ingredient, user_ingredients)
                    when "Remove Ingredients"
                        ingredient = display_user_ingredients_sub_menu(user_ingredients)
                        remove_ingredients(ingredient, user_ingredients)
                    else
                        next
                end
                # puts "Press enter key to go back to main menu"
                # gets
                # system "clear"
            end
        when "Matching Recipes"
            puts "Here are your matching recipes"
        when "My Recipes"
            puts "Here are the recipes you selected"
        when "Shopping List"
                puts "Here are the ingredients you need to buy"
        else
            system "clear"
            puts "Thanks for stopping by!"
            next
    end
    # puts "Press enter key to go back to main menu"
    # gets
    system "clear"
end
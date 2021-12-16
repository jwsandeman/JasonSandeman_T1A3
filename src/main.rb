require_relative "./seed.rb"
require "tty-prompt"
require 'colorize'
require 'artii'

$recipes = seed
$prompt = TTY::Prompt.new
artii = Artii::Base.new

# -----------------------------------------------------------------------------------------------------
# MENUS
# -----------------------------------------------------------------------------------------------------
def main_menu
    answer = $prompt.select("Please choose from the menu options below".colorize(:cyan), ["Select Ingredients", "Matching Recipes", "My Recipes", "Shopping List", "Exit"])
    return answer
end

def ingredient_sub_menu
    answer = $prompt.select("Would you like to add or remove an ingredient from your list?".colorize(:cyan), ["Add Ingredients", "Remove Ingredients","Go Back"])
    return answer  
end

def recipe_sub_menu
    answer = $prompt.select("Would you like to add or remove a recipe from your list?".colorize(:cyan), ["Add Recipe", "Remove Recipe","Go Back"])
    return answer  
end

def add_ingredients_sub_menu
    answer = $prompt.select("What ingredients do you currently have at home? You can add as many ingredients as you like. Scroll down for more options.".colorize(:cyan), [$recipes.display_ingredients, "Finished Adding Ingredients"])
    return answer  
end

def remove_ingredients_sub_menu(user_ingredients)
    answer = $prompt.select("What ingredients would you like to remove from your list? You can remove as many ingredients as you like".colorize(:cyan), [user_ingredients, "Finished Removing Ingredients"])
    return answer  
end

def add_recipes_sub_menu
    answer = $prompt.select("What recipes would you like to add to your list? Press enter on a recipe to add it to your list. You can add as many recipes as you like".colorize(:cyan), [$recipes.individual_recipe, "Finished Adding Recipes"])
    return answer.to_s
end

def remove_recipes_sub_menu(user_recipes)
    answer = $prompt.select("What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like".colorize(:cyan), [user_recipes, "Finished Removing Recipes"])
    return answer  
end

def user_recipes_sub_menu(user_recipes)
    answer = $prompt.select("What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like".colorize(:cyan), [user_recipes, "Finished Viewing Recipes"])
    return answer  
end

# -----------------------------------------------------------------------------------------------------
# SELECT INGREDIENTS FEATURE
# -----------------------------------------------------------------------------------------------------
def add_ingredients(ingredient, user_ingredients)
    system "clear"
    if ingredient != "Finished Adding Ingredients"
        if user_ingredients.find {|item| item == ingredient}
            puts "You have already added that ingredient, please choose a different ingredient".colorize(:red)
        else
            # this piece of code is causing bugs need to investigate
            user_ingredients.push(ingredient)
            # TESTED
            $recipes.individual_recipe.each_with_index do |item, index|
                if item.ingredients.has_key?(ingredient)
                    item.ingredients[ingredient] = true
                end
            end
        end
    end
end

def remove_ingredients(ingredient, user_ingredients)
    system "clear"
    if ingredient != "Finished Removing Ingredients"
        user_ingredients.delete(ingredient)
        # TESTED
        $recipes.individual_recipe.each_with_index do |item, index|
            if item.ingredients.has_key?(ingredient)
                item.ingredients[ingredient] = false
            end
        end
    end
end

# -----------------------------------------------------------------------------------------------------
# MATCHING RECIPES FEATURE
# -----------------------------------------------------------------------------------------------------
# this is not working properly as it is only incrementing over 1 recipe. now it seems to be working?? what did i change.. no idea.
def matching_recipes
    # need to test this - may not even need it
    $recipes.individual_recipe.each do |item|
        item.selected_ingredients
    end
end

def add_recipes(recipe, user_recipes)
    system "clear"
    if recipe != "Finished Adding Recipes"
        if user_recipes.find {|item| item == recipe}
            puts "You have already added that recipe, please choose a different recipe".colorize(:red)
        else
            user_recipes.push(recipe)
            # TESTED
            $recipes.individual_recipe.each do |item|
                if recipe.include? item.name
                    item.selected_recipe = true
                end
            end
        end
    end
end

# -----------------------------------------------------------------------------------------------------
# MY RECIPES FEATURE
# -----------------------------------------------------------------------------------------------------

# TESTED - prints full recipe method in a list to the screen
def display_entire_recipe(recipe, user_recipes)
    system "clear"
    if recipe != "Finished Viewing Recipes"
        if user_recipes.find {|item| item == recipe}
            $recipes.individual_recipe.each do |item|
                if recipe.include? item.name
                    item.print_full_recipe
                end
            end
        end
    end
end

def remove_recipes(recipe, user_recipes)
    system "clear"
    if recipe != "Finished Removing Recipes"
        user_recipes.delete(recipe)
        # NEED TO TEST
        $recipes.individual_recipe.each do |item|
            if recipe.include? item.name
                item.selected_recipe = false
            end
        end
    end
end

# -----------------------------------------------------------------------------------------------------
# WELCOME SCREEN AND MAIN MENU LOGIC
# -----------------------------------------------------------------------------------------------------
system "clear"
puts artii.asciify('The Recipe Bot').colorize(:green)
name = ""
if name != ""
    puts "Welcome to your personalised recipe suggestion bot #{name}".colorize(:cyan)
else
    puts "Welcome to your personalised recipe suggestion bot! What is your Name?".colorize(:cyan)
    name = gets.chomp
end
system "clear"
puts "Thanks #{name}, now let's see what you've got lying around the pantry!".colorize(:cyan)
option = ""
user_ingredients = []
user_recipes = []
while option != "Exit"
    option = main_menu
    case option
        when "Select Ingredients"
            system "clear"
            add_remove_option = ""
            while add_remove_option != "Go Back"
                add_remove_option = ingredient_sub_menu
                case add_remove_option
                    when "Add Ingredients"
                        system "clear"
                        added_ingredient = ""
                        while added_ingredient != "Finished Adding Ingredients"
                            puts user_ingredients
                            # puts $recipes.display_ingredients
                            added_ingredient = add_ingredients_sub_menu
                            add_ingredients(added_ingredient, user_ingredients)
                        end
                    when "Remove Ingredients"
                        system "clear"
                        if user_ingredients != []
                            removed_ingredient = ""
                            while removed_ingredient != "Finished Removing Ingredients"
                                puts user_ingredients
                                removed_ingredient = remove_ingredients_sub_menu(user_ingredients)
                                remove_ingredients(removed_ingredient, user_ingredients)
                            end
                        else
                            system "clear"
                            puts "You need to add some ingredients first".colorize(:red)
                        end
                    else
                        next
                end
            end
            system "clear"
        when "Matching Recipes"
            system "clear"
            if user_ingredients != []
                add_remove_option = ""
                while add_remove_option != "Go Back"
                    add_remove_option = recipe_sub_menu
                    case add_remove_option
                        when "Add Recipe"
                            system "clear"
                            recipe = ""
                            matching_recipes
                            while recipe != "Finished Adding Recipes"
                                puts user_recipes
                                recipe = add_recipes_sub_menu
                                add_recipes(recipe, user_recipes)
                            end
                        when "Remove Recipe"
                            system "clear"
                            if user_recipes != []
                                recipe = ""
                                while recipe != "Finished Removing Recipes"
                                    puts user_recipes
                                    recipe = remove_recipes_sub_menu(user_recipes)
                                    remove_recipes(recipe, user_recipes)
                                end
                            else
                                system "clear"
                                puts "You need to add some recipes first".colorize(:red)
                            end
                        else
                            next
                    end
                end
            else
                puts "You need to add some ingredients first before we can reccomend any recipes.".colorize(:red)
            end
        when "My Recipes"
            system "clear"
            if user_recipes != []
                recipe = ""
                while recipe != "Finished Viewing Recipes"
                    # puts user_recipes
                    recipe = user_recipes_sub_menu(user_recipes)
                    display_entire_recipe(recipe, user_recipes)
                    # puts "Press 'Enter' to go back".colorize(:cyan)
                    # gets
                    # system "clear"
                end
            else
                puts "You need to add some recipes first.".colorize(:red)
            end
        when "Shopping List"
            if user_ingredients != [] && user_recipes != []
                system "clear"
                selected_recipes_list = []
                selected_recipes_list = $recipes.selected_recipes
                # puts $recipes.selected_recipes
                puts "Here are the ingredients you need to buy".colorize(:cyan)
                $recipes.display_missing_ingredients(selected_recipes_list)
                puts "press 'Enter' to go back".colorize(:cyan)
                gets
                system "clear"
            else 
                system "clear"
                puts "You need to add some ingredients and recipes first before we can create the shopping list.".colorize(:red)
            end
        else
            system "clear"
            puts artii.asciify('Thanks for stopping by!').colorize(:green)
            next
    end
    # puts "Press enter key to go back to main menu"
    # gets
    # system "clear"
end
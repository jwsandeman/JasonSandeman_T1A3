require_relative "./seed.rb"
require "tty-prompt"

$recipes = seed
$prompt = TTY::Prompt.new

# -----------------------------------------------------------------------------------------------------
# MENUS
# -----------------------------------------------------------------------------------------------------
def main_menu
    answer = $prompt.select("Please choose from the menu options below", ["Select Ingredients", "Matching Recipes", "My Recipes", "Shopping List", "Exit"])
    return answer
end

def ingredient_sub_menu
    answer = $prompt.select("Would you like to add or remove an ingredient from your list?", ["Add Ingredients", "Remove Ingredients","Go Back"])
    return answer  
end

def recipe_sub_menu
    answer = $prompt.select("Would you like to add or remove a recipe from your list?", ["Add Recipe", "Remove Recipe","Go Back"])
    return answer  
end

def add_ingredients_sub_menu
    answer = $prompt.select("What ingredients do you currently have at home? Press enter on an ingredient to add it to your list. You can add as many ingredients as you like", [$recipes.display_ingredients, "Finished Adding Ingredients"])
    return answer  
end

def remove_ingredients_sub_menu(user_ingredients)
    answer = $prompt.select("What ingredients would you like to remove from your list? Press enter on an ingredient to remove it from your list. You can remove as many ingredients as you like", [user_ingredients, "Finished Removing Ingredients"])
    return answer  
end

def add_recipes_sub_menu
    answer = $prompt.select("What recipes would you like to add to your list? Press enter on a recipe to add it to your list. You can add as many recipes as you like", [$recipes.individual_recipe, "Finished Adding Recipes"])
    return answer.to_s
end

def remove_recipes_sub_menu(user_recipes)
    answer = $prompt.select("What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like", [user_recipes, "Finished Removing Recipes"])
    return answer  
end

def user_recipes_sub_menu(user_recipes)
    answer = $prompt.select("What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like", [user_recipes, "Finished Viewing Recipes"])
    return answer  
end
# trialling this function with select_recipes function
# may not need this function as it does exactly the same thing as returning the user_recipes array. ill probably adjust the function to display ingredients as needed for the shopping list.
# def user_recipes_sub_menu(user_recipes)
#     answer = $prompt.select("What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like", [$recipes.selected_recipes, "Finished Viewing Recipes"])
#     return answer  
# end

# -----------------------------------------------------------------------------------------------------
# SELECT INGREDIENTS FEATURE
# -----------------------------------------------------------------------------------------------------
def add_ingredients(ingredient, user_ingredients)
    system "clear"
    if ingredient != "Finished Adding Ingredients"
        if user_ingredients.find {|item| item == ingredient}
            puts "You have already added that ingredient, please choose a different ingredient"
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
            puts "You have already added that recipe, please choose a different recipe"
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

# this is not working as intended
def display_entire_recipe(recipe, user_recipes)
    system "clear"
    if recipe != "Finished Viewing Recipes"
        if user_recipes.find {|item| item == recipe}
            # $recipes.individual_recipe.find {|item| item.print_full_recipe}
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
# SHOPPING LIST FEATURE
# -----------------------------------------------------------------------------------------------------
# def shopping_list
#     $recipes.selected_recipes
# end

# -----------------------------------------------------------------------------------------------------
# WELCOME SCREEN AND MAIN MENU LOGIC
# -----------------------------------------------------------------------------------------------------
system "clear"
# puts "Welcome to your personalised Recipe Suggestion Application! What is your Name?"
# name = gets.chomp
# puts "Thanks #{name}, now let's find some recipes to cook!"
option = ""
user_ingredients = []
user_recipes = []
while option != "Exit"
    option = main_menu
    case option
        when "Select Ingredients"
            add_remove_option = ""
            while add_remove_option != "Go Back"
                add_remove_option = ingredient_sub_menu
                case add_remove_option
                    when "Add Ingredients"
                        added_ingredient = ""
                        while added_ingredient != "Finished Adding Ingredients"
                            puts user_ingredients
                            # puts $recipes.display_ingredients
                            added_ingredient = add_ingredients_sub_menu
                            add_ingredients(added_ingredient, user_ingredients)
                        end
                    when "Remove Ingredients"
                        if user_ingredients != []
                            removed_ingredient = ""
                            while removed_ingredient != "Finished Removing Ingredients"
                                puts user_ingredients
                                removed_ingredient = remove_ingredients_sub_menu(user_ingredients)
                                remove_ingredients(removed_ingredient, user_ingredients)
                            end
                        else
                            puts "You need to add some ingredients first"
                        end
                    else
                        next
                end
            end
        when "Matching Recipes"
            if user_ingredients != []
                add_remove_option = ""
                while add_remove_option != "Go Back"
                    add_remove_option = recipe_sub_menu
                    case add_remove_option
                        when "Add Recipe"
                            recipe = ""
                            matching_recipes
                            while recipe != "Finished Adding Recipes"
                                puts user_recipes
                                recipe = add_recipes_sub_menu
                                add_recipes(recipe, user_recipes)
                            end
                        when "Remove Recipe"
                            if user_recipes != []
                                recipe = ""
                                while recipe != "Finished Removing Recipes"
                                    puts user_recipes
                                    recipe = remove_recipes_sub_menu(user_recipes)
                                    remove_recipes(recipe, user_recipes)
                                end
                            else
                                puts "You need to add some recipes first"
                            end
                        else
                            next
                    end
                end
            else
                puts "You need to add some ingredients first before we can reccomend any recipes."
            end
        when "My Recipes"
            if user_recipes != []
                recipe = ""
                while recipe != "Finished Viewing Recipes"
                    puts user_recipes
                    recipe = user_recipes_sub_menu(user_recipes)
                    display_entire_recipe(recipe, user_recipes)
                    puts "Press 'Enter' to go back"
                    gets
                    # system "clear"
                end
            else
                puts "You need to add some recipes first."
            end
        when "Shopping List"
                selected_recipes_list = []
                selected_recipes_list = $recipes.selected_recipes
                # puts $recipes.selected_recipes
                puts "Here are the ingredients you need to buy"
                $recipes.display_missing_ingredients(selected_recipes_list)
                puts "press enter to go back"
                gets
                system "clear"
        else
            system "clear"
            puts "Thanks for stopping by!"
            next
    end
    # puts "Press enter key to go back to main menu"
    # gets
    # system "clear"
end
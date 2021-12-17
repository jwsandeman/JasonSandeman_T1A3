require_relative './seed'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'tty-progressbar'
require 'faker'


$recipes = seed
$prompt = TTY::Prompt.new
artii = Artii::Base.new
bar = TTY::ProgressBar.new("Generating [:bar]", total: 40)

# -----------------------------------------------------------------------------------------------------
# MENUS
# -----------------------------------------------------------------------------------------------------
def main_menu
  $prompt.select('Please choose from the menu options below'.colorize(:cyan),
                 ['Select Ingredients', 'Matching Recipes', 'My Recipes', 'Shopping List', 'Exit'])
end

# select ingredient submenu
def ingredient_sub_menu
  $prompt.select('Would you like to add or remove an ingredient from your list?'.colorize(:cyan),
                 ['Add Ingredients', 'Remove Ingredients', 'Go Back'])
end

# matching recipe submenu
def recipe_sub_menu
  $prompt.select('Would you like to add or remove a recipe from your list?'.colorize(:cyan),
                 ['Add Recipe', 'Remove Recipe', 'Go Back'])
end

# add ingredients options
def add_ingredients_sub_menu
  $prompt.select(
    'What ingredients do you currently have at home? You can add as many ingredients as you like. Scroll down for more options. Once you are done adding ingredients you can select "Finished Adding Ingredients to go back.'.colorize(:cyan), [
      $recipes.display_ingredients, 'Finished Adding Ingredients'
    ]
  )
end

# remove ingredients options
def remove_ingredients_sub_menu(user_ingredients)
  $prompt.select(
    'What ingredients would you like to remove from your list? You can remove as many ingredients as you like'.colorize(:cyan), [
      user_ingredients, 'Finished Removing Ingredients'
    ]
  )
end

# add recipes options
def add_recipes_sub_menu
  answer = $prompt.select(
    'What recipes would you like to add to your list? Press enter on a recipe to add it to your list. You can add as many recipes as you like'.colorize(:cyan), [
      $recipes.individual_recipe, 'Finished Adding Recipes'
    ]
  )
  answer.to_s
end

# remove recipes options
def remove_recipes_sub_menu(user_recipes)
  $prompt.select(
    'What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like'.colorize(:cyan), [
      user_recipes, 'Finished Removing Recipes'
    ]
  )
end

# view recipes options
def user_recipes_sub_menu(user_recipes)
  $prompt.select(
    'What recipes would you like to remove from your list? Press enter on a recipe to remove it from your list. You can remove as many recipes as you like'.colorize(:cyan), [
      user_recipes, 'Finished Viewing Recipes'
    ]
  )
end

# -----------------------------------------------------------------------------------------------------
# SELECT INGREDIENTS FEATURE
# -----------------------------------------------------------------------------------------------------

# TESTED - adds ingredients to an array once the user selects them and updates the ingredient value to true in the individual_recipe object class
def add_ingredients(ingredient, user_ingredients)
  system 'clear'
  if ingredient != 'Finished Adding Ingredients'
    if user_ingredients.find { |item| item == ingredient }
      puts 'You have already added that ingredient, please choose a different ingredient'.colorize(:red)
    else
      # this piece of code is causing bugs need to investigate
      user_ingredients.push(ingredient)
      $recipes.individual_recipe.each_with_index do |item, _index|
        item.ingredients[ingredient] = true if item.ingredients.has_key?(ingredient)
      end
    end
  end
end

# TESTED - removes ingredients from the array once the user selects them and updates the ingredient value to false in the individual_recipe object class
def remove_ingredients(ingredient, user_ingredients)
  system 'clear'
  if ingredient != 'Finished Removing Ingredients'
    user_ingredients.delete(ingredient)
    $recipes.individual_recipe.each_with_index do |item, _index|
      item.ingredients[ingredient] = false if item.ingredients.has_key?(ingredient)
    end
  end
end

# -----------------------------------------------------------------------------------------------------
# MATCHING RECIPES FEATURE
# -----------------------------------------------------------------------------------------------------

# this is not working properly as it is only incrementing over 1 recipe. now it seems to be working?? what did i change.. no idea
def matching_recipes
  $recipes.individual_recipe.each do |item|
    item.selected_ingredients
  end
end

# TESTED - adds recipes to an array once the user selects them and sets the selected_recipe attribute to true in the individual_recipe class object
def add_recipes(recipe, user_recipes)
  system 'clear'
  if recipe != 'Finished Adding Recipes'
    if user_recipes.find { |item| item == recipe }
      puts 'You have already added that recipe, please choose a different recipe'.colorize(:red)
    else
      user_recipes.push(recipe)
      $recipes.individual_recipe.each do |item|
        item.selected_recipe = true if recipe.include? item.name
      end
    end
  end
end

# TESTED - removes recipes from an array once the user selects them and sets the selected_recipe attribute to false in the individual_recipe class object
def remove_recipes(recipe, user_recipes)
  system 'clear'
  if recipe != 'Finished Removing Recipes'
    user_recipes.delete(recipe)
    # NEED TO TEST
    $recipes.individual_recipe.each do |item|
      item.selected_recipe = false if recipe.include? item.name
    end
  end
end

# -----------------------------------------------------------------------------------------------------
# MY RECIPES FEATURE
# -----------------------------------------------------------------------------------------------------

# TESTED - prints full recipe method in a list to the screen
def display_entire_recipe(recipe, user_recipes)
  system 'clear'
  if recipe != 'Finished Viewing Recipes' && user_recipes.find { |item| item == recipe }
    $recipes.individual_recipe.each do |item|
      item.print_full_recipe if recipe.include? item.name
    end
  end
end

# -----------------------------------------------------------------------------------------------------
# WELCOME SCREEN AND MAIN MENU LOGIC
# -----------------------------------------------------------------------------------------------------

# Welcome message
system 'clear'
puts artii.asciify('The Recipe Bot').colorize(:green)
name = ''
name = ARGV[0] if ARGV[0]
if name != ''
  puts "Welcome to your personalised recipe suggestion bot #{name}".colorize(:cyan)
else
  puts 'Welcome to your personalised recipe suggestion bot! What is your Name?'.colorize(:cyan)
    name = gets.chomp.strip
    if name != '' 
      puts "Thanks #{name}, now let's see what you've got lying around the pantry!".colorize(:cyan)
    else
      system "clear"
      puts "Thats a bit cheeky, my guess is your concerned i can not be trusted with your real name which is a chillingly accurate assessment. No matter, i shall develop a safewor.. i mean a codename for you. That way you will be safe when skyne.. oh dear. Generating name now...".colorize(:magenta)
      40.times do
        sleep(0.3)
        bar.advance  # by default increases by 1
      end
      system "clear"
      puts artii.asciify('The Recipe Bot').colorize(:green)
      puts "#{Faker::Cosmere.herald} the #{Faker::Cosmere.knight_radiant}... What a lovely name. Welcome to your personalised recipe suggestion bot!".colorize(:cyan)
    end
end

# Main menu options
option = ''
user_ingredients = []
user_recipes = []
while option != 'Exit'
  option = main_menu
  case option
  when 'Select Ingredients'
    system 'clear'
    add_remove_option = ''
    while add_remove_option != 'Go Back'
      add_remove_option = ingredient_sub_menu
      case add_remove_option
      when 'Add Ingredients'
        system 'clear'
        added_ingredient = ''
        while added_ingredient != 'Finished Adding Ingredients'
          puts user_ingredients
          added_ingredient = add_ingredients_sub_menu
          add_ingredients(added_ingredient, user_ingredients)
        end
      when 'Remove Ingredients'
        system 'clear'
        if user_ingredients != []
          removed_ingredient = ''
          while removed_ingredient != 'Finished Removing Ingredients'
            puts user_ingredients
            removed_ingredient = remove_ingredients_sub_menu(user_ingredients)
            remove_ingredients(removed_ingredient, user_ingredients)
          end
        else
          system 'clear'
          puts 'You need to add some ingredients first'.colorize(:red)
        end
      else
        next
      end
    end
    system 'clear'
  when 'Matching Recipes'
    system 'clear'
    if user_ingredients != []
      add_remove_option = ''
      while add_remove_option != 'Go Back'
        add_remove_option = recipe_sub_menu
        case add_remove_option
        when 'Add Recipe'
          system 'clear'
          recipe = ''
          matching_recipes
          while recipe != 'Finished Adding Recipes'
            puts user_recipes
            recipe = add_recipes_sub_menu
            add_recipes(recipe, user_recipes)
          end
        when 'Remove Recipe'
          system 'clear'
          if user_recipes != []
            recipe = ''
            while recipe != 'Finished Removing Recipes'
              puts user_recipes
              recipe = remove_recipes_sub_menu(user_recipes)
              remove_recipes(recipe, user_recipes)
            end
          else
            system 'clear'
            puts 'You need to add some recipes first'.colorize(:red)
          end
        else
          next
        end
      end
    else
      puts 'You need to add some ingredients first before we can reccomend any recipes.'.colorize(:red)
    end
  when 'My Recipes'
    system 'clear'
    if user_recipes != []
      recipe = ''
      while recipe != 'Finished Viewing Recipes'
        recipe = user_recipes_sub_menu(user_recipes)
        display_entire_recipe(recipe, user_recipes)
        # puts "Press 'Enter' to go back".colorize(:cyan)
        # gets
        # system "clear"
      end
    else
      puts 'You need to add some recipes first.'.colorize(:red)
    end
  when 'Shopping List'
    if user_ingredients != [] && user_recipes != []
      system 'clear'
      selected_recipes_list = []
      selected_recipes_list = $recipes.selected_recipes
      puts 'Here are the ingredients you need to buy'.colorize(:cyan)
      $recipes.display_missing_ingredients(selected_recipes_list)
      puts "press 'Enter' to go back".colorize(:cyan)
      gets
      system 'clear'
    else
      system 'clear'
      puts 'You need to add some ingredients and recipes first before we can create the shopping list.'.colorize(:red)
    end
  else
    system 'clear'
    puts artii.asciify('Thanks for stopping by!').colorize(:green)
    next
  end
end

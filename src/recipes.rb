require_relative './individual_recipe'

class Recipes
  attr_reader :individual_recipe

  def initialize(individual_recipe)
    @individual_recipe = individual_recipe
  end

  # MANUALLY TESTED - displays all ingredients from all available recipes
  def display_ingredients
    available_ingredients = []
    @individual_recipe.each do |item|
      available_ingredients.push(item.ingredients.keys)
    end
    available_ingredients
  end

  # TESTED - finds the recipes that the user has selected based on the selected_recipe attribute being set to true and returns an array of recipe ingredients
  def selected_recipes
    selected_recipes = []
    @individual_recipe.each do |i|
      selected_recipes.push(i.ingredients.each { |k, _v| k }) if i.selected_recipe == true
    end
    selected_recipes
  end

  # TESTED - displays all of the ingredients that have their values set to false (meaning the user has not selected those ingredients)
  def display_missing_ingredients(ingredients)
    unselected_ingredients = []
    missing_ingredients = []
    ingredients.each do |item|
      unselected_ingredients.push(item.select { |_k, v| v == false })
    end
    missing_ingredients.push(unselected_ingredients.each { |i| puts i.keys })
    missing_ingredients
  end

  # TESTED - this is redundant code as it was only used to confirm a test before being used inside main.rb
  def ingredient_select(ingredient)
    @individual_recipe.each_with_index do |item, _index|
      next unless item.ingredients.has_key?(ingredient)

      item.ingredients[ingredient] = true
      # these were only used for the rspec test
      # return item.ingredients[ingredient]
      # return ingredient
      # return index
    end
  end

  # TESTED - this is redundant code as it was only used to confirm a test before being used inside main.rb
  def testing_string(name)
    @individual_recipe.each do |item|
      if name.include? item.name
        item.selected_recipe = true
        return item.selected_recipe
      end
    end
  end
end

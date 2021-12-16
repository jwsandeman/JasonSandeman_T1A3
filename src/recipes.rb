require_relative "./individual_recipe"

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
        return available_ingredients
    end

    # TESTED - finds the recipes that the user has selected based on the selected_recipe attrbute being set to true and returns an array of recipe ingredients - maybe this function could be moved into main to help it work with display_missing_ingredients better
    def selected_recipes
        selected_recipes = []
        @individual_recipe.each do |i|
            if i.selected_recipe == true
                selected_recipes.push(i.ingredients.each{|k, v| k})
            end
        end
        return selected_recipes
    end

    # TESTED - displays all of the ingredients that have their values set to false (meaning the user has not selected those ingredients)
    def display_missing_ingredients(ingredients)
        unselected_ingredients = []
        missing_ingredients = []
        ingredients.each do |item|
        # @individual_recipe.each do |item|
            # unselected_ingredients.push(item.ingredients.select {|k, v| v == false})
            unselected_ingredients.push(item.select {|k, v| v == false})
        end
        # missing_ingredients.push(unselected_ingredients.each {|k, v| k})
        missing_ingredients.push(unselected_ingredients.each{|i| puts i.keys})
        # unselected_ingredients.each {|k, v| puts k}
        # unselected_ingredients.each do |k, v|
        #     missing_ingredients.push(k)
        # end
        return missing_ingredients
        # return unselected_ingredients
    end

    # TESTED - i used this to test my function inside main.rb
    def ingredient_select(ingredient)
        @individual_recipe.each_with_index do |item, index|
            if item.ingredients.has_key?(ingredient)
                item.ingredients[ingredient] = true
                # these were only used for the rspec test
                # return item.ingredients[ingredient]
                # return ingredient
                # return index
            end
        end
    end

    def testing_string(name)
        @individual_recipe.each do |item|
            if name.include? item.name
                item.selected_recipe = true
                return item.selected_recipe
            end
        end
    end
end
require_relative "./individual_recipe"

class Recipes
    attr_reader :individual_recipe
    def initialize(individual_recipe)
        @individual_recipe = individual_recipe
    end

    def display_ingredients
        available_ingredients = []
        @individual_recipe.each do |item|
            available_ingredients.push(item.ingredients.keys)
        end
        return available_ingredients
    end

    # finds the recipes that the user has selected based on the selected_recipe attrbute being set to true and returns an array of ingredients
    def selected_recipes
        selected_recipes = []
        missing_ingredients = []
        @individual_recipe.each do |i|
            if i.selected_recipe == true
                # selected_recipes.push(i)
                selected_recipes.push(i.name)
            end
        end
        # return selected_recipes.each {|i| i[0]}
        return selected_recipes
    end

    # displays all of the ingredients that have values set to false meaning the user has not selected them
    def display_missing_ingredients(ingredients)
        unselected_ingredients = []
        missing_ingredients = []
        ingredients.each do |item|
        # @individual_recipe.each do |item|
            # missing_ingredients.push(item.ingredients.keys.select{|k, v| v == false})
            unselected_ingredients.push(item.select {|k, v| v == false})
        end
        unselected_ingredients.each do |i|
        missing_ingredients.push(i.keys)
        # missing_ingredients.push(i.flat_map(&:keys))
        end
        return missing_ingredients
    end

    def display_recipe_method(recipe)
        if @individual_recipe.find {|item| item.name == recipe}
            return @individual_recipe.find {|item| item.name == recipe}
            # return "#{@individual_recipe[name].name}"
            # puts "Ingredients:"
            # puts "#{@individual_recipe.ingredients.flat_map(&:keys)}"
            # puts "Instructions:"
            # puts "#{@individual_recipe.instructions.each {|item| puts item}}"
            # puts "Serves #{@individual_recipe.serves}"  
        end      
    end

    def display_recipes
        
    end

    def find_ingredient(ingredient)
        @individual_recipe.each do |item, index|
            if item.ingredients.keys == ingredient
                return index
            end
        end
        return -1
    end

    def add_recipe
        
    end

    def remove_recipe
        
    end

end
require_relative "./individual_recipe"

class Recipes
    attr_reader :individual_recipe
    def initialize(individual_recipe)
        @individual_recipe = individual_recipe
    end

    def display_ingredients
        @individual_recipe.each {|item| return item.ingredients.flat_map(&:keys)}
    end

    def display_recipes
        
    end

    def find_recipe
        
    end

    def add_recipe
        
    end

    def remove_recipe
        
    end

end
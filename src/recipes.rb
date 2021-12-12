require_relative "./individual_recipe"

class Recipes
    attr_reader :individual_recipe
    def initialize(individual_recipe)
        @individual_recipe = individual_recipe
    end

    def display_ingredients
        # available_ingredients = []
        # @individual_recipe.each do |item|
        #     available_ingredients = puts item.ingredients.keys
        # end
        # available_ingredients

        @individual_recipe.each do |item|
            return item.ingredients.keys
        end

        # flat_map(&:keys)

        # @individual_recipe.map do |item|
        #     item.select do |key, value|
        #         [].include? key
        # end
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
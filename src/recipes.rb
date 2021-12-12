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

    def display_missing_ingredients
        selected_ingredients = []
        missing_ingredients = []
        @individual_recipe.each do |item|
            # missing_ingredients.push(item.ingredients.keys.select{|k, v| v == false})
            selected_ingredients.push(item.ingredients.select {|k, v| v == false})
        end
        selected_ingredients.each do |i|
            missing_ingredients.push(i.keys)
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

    def add_recipe
        
    end

    def remove_recipe
        
    end

end
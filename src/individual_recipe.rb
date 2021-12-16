require 'colorize'

class IndividualRecipe
    attr_reader :name, :instructions, :serves
    attr_accessor :ingredients, :selected_recipe, :selected_ingredients
    def initialize(name, ingredients, instructions, serves)
        @name = name
        @instructions = instructions
        @ingredients = ingredients
        @serves = serves
        @selected_ingredients = 0
        @selected_recipe = false
        @total_ingredients = 0
    end

    def to_s
        "#{@name} (you have #{@selected_ingredients}/#{@ingredients.length} ingredients)"
    end

    # TESTED - increments @selected_ingredients for each ingredient that has a value of true
    def selected_ingredients
        @ingredients.each do |k, v|
            # if item.has_value?(true)
            if v == true
                @selected_ingredients += 1
            end
        end
        # used below return for test case
        return @selected_ingredients
    end

    # MANUALLY TESTED - prints the full recipe method
    def print_full_recipe
        "#{@name}"
        puts "Ingredients:".colorize(:cyan)
        "#{@ingredients.each{|k, v| puts k}}"
        puts "Instructions:".colorize(:cyan)
        "#{@instructions.each{|i| puts i}}"
        "Serves: #{@serves}"
    end

end


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

    # increments @selected_ingrdients every time an ingredient is selected. Needs more testing as its only incrementing in the first recipe
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

    # prints the full recipe method
    def print_full_recipe
        "#{@name}"
        puts "Ingredients:"
        "#{@ingredients.each{|k, v| puts k}}"
        puts "Instructions:"
        "#{@instructions.each{|i| puts i}}"
        "Serves: #{@serves}" 
    end

end


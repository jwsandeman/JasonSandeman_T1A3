class IndividualRecipe
    attr_reader :name, :instructions, :serves
    attr_accessor :ingredients
    def initialize(name, ingredients, instructions, serves)
        @name = name
        @instructions = instructions
        @ingredients = ingredients
        @serves = serves
        @selected_ingredients = 0
    end

    def to_s
        "#{@name} (you have #{@selected_ingredients} ingredients)"
    end
    def selected_ingredients
        @ingredients.each do |item|
            if item.has_value?(true)
                @selected_ingredients += 1
            end
        end
        puts "Selected Ingredients:#{@selected_ingredients}"
    end
end


class IndividualRecipe
    attr_reader :name, :instructions, :serves
    attr_accessor :ingredients
    def initialize(name, ingredients, instructions, serves)
        @name = name
        @instructions = instructions
        @ingredients = ingredients
        @serves = serves
    end

    def to_s
        "#{@name}(Serves: #{@serves})"        
    end
end

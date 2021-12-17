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
    n = 0
    @ingredients.each do |_k, v|
      # @selected_ingredients += 1 if v == true
      n += 1 if v == true
    end
    @selected_ingredients = n
    # used below return for test case
    # @selected_ingredients
  end

  # MANUALLY TESTED - prints the full recipe method
  def print_full_recipe
    @name.to_s
    puts 'Ingredients:'.colorize(:cyan)
    (@ingredients.each { |k, _v| puts k }).to_s
    puts 'Instructions:'.colorize(:cyan)
    (@instructions.each { |i| puts i }).to_s
    "Serves: #{@serves}"
  end
end

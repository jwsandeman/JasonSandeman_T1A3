require_relative "./seed.rb"
require "tty-prompt"

recipe = seed
$prompt = TTY::Prompt.new

def main_menu
    answer = $prompt.select("Please choose from the menu options below", ["Select Ingredients", "Matching Recipes", "My Recipes", "Shopping List", "Exit"])
    return answer
end

def select_sub_menu
    answer = $prompt.select("Would you like to add or remove an ingredient from your list?", ["Add Ingredients", "Remove Ingredients","Go Back"])
    return answer  
end

def select_ingredients

end

def matching_recipes
    
end

def my_ingredients
    
end

def shopping_list
    
end

system "clear"
puts "Welcome to your personalised Recipe Suggestion Application! What is your Name?"
name = gets.chomp
puts "Thanks #{name}, now let's find some recipes to cook!"
option = ""
while option != "Exit"
    option = main_menu
    case option
        when "Select Ingredients"
            option1 = ""
            while option1 != "Go Back"
            option1 = select_sub_menu
                case option1
                    when "Add Ingredients"
                        puts "Add ingredients"
                    when "Remove Ingredients"
                        puts "Remove Ingredients"
                    else
                        next
                end
                # puts "Press enter key to go back to main menu"
                # gets
                # system "clear"
            end
        when "Matching Recipes"
            puts "Here are your matching recipes"
        when "My Recipes"
            puts "Here are the recipes you selected"
        when "Shopping List"
                puts "Here are the ingredients you need to buy"
        else
            system "clear"
            puts "Thanks for stopping by!"
            next
    end
    puts "Press enter key to go back to main menu"
    gets
    system "clear"
end
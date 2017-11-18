require './colorize.rb'
require_relative 'game.rb'

module Mastermind

    game = Game.new
    game.welcome
    game.set_rules
    game.set_combination
    counter = 0
    attm_arr = game.attempts
    check_atte_arr = attm_arr.clone
    feedback = attm_arr.clone
    
    loop {
    game_won = false
    size = game.combination_size
    rounds = game.rounds
    puts "What is your Guess ? #{rounds - counter}/#{rounds} attempts left".cyan
    guess = gets.chomp.to_s.split("").map(&:to_i)
    check_atte_arr = attm_arr.clone
    feedback = attm_arr.clone
    breaker_count = 0
    counter +=1

    guess.each do |item| 
        if [1,2,3,4,5,6].include?(item)
            if guess.length == size 
                # DO CHECKING
                 if guess == game.combination
                    puts "YOU ARE ABSOLUTE WINNER"
                    rounds = counter
                    game_won = true
                    break
                 end
               
                 if item == game.combination[breaker_count]
                    check_atte_arr[breaker_count] = item
                 elsif game.combination.include?(guess[breaker_count]) && !check_atte_arr.include?(guess[breaker_count]) 
                    feedback[breaker_count] = item
                 end
                 breaker_count +=1
            else
                counter -=1
                puts "Invalid length".red
                puts "Please make sure your guess is #{size} in length, and does not contain a letter".red
                break
            end
        else
            puts "YOU CANT TYPE LETTERS".red
            puts "OR numbers greater than 6".red
            counter -=1
            break            
        end
    end
    
    game.draw_feedback(guess,feedback,check_atte_arr)                
    if counter == rounds
      if game_won
        puts "Hurray YOU WON THE GAME".magenta
        puts "            
            OOOOOOOOOOO
         OOOOOOOOOOOOOOOOOOO
      OOOOOO  OOOOOOOOO  OOOOOO
    OOOOOO      OOOOO      OOOOOO
  OOOOOOOO  #   OOOOO  #   OOOOOOOO
 OOOOOOOOOO    OOOOOOO    OOOOOOOOOO
OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO
 OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO
  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO
    OOOOO   OOOOOOOOOOOOOOO   OOOO
      OOOOOO   OOOOOOOOO   OOOOOO
         OOOOOO         OOOOOO
             OOOOOOOOOOOO
".magenta
      else
        puts "You lost this game.".magenta
        puts "
        (```\        .-'""""`-.        /```)____
 (____     \_____ /  (O  O)  \ _____/     ____)
(____            (      )     )            ____)
 (____     _______\   ____   /_______     ____)
   (______/        `-.____.-'        \______)
                      *HUG*
        ".magenta
        puts "By the way the code was #{game.combination.join}".magenta
      end
        break
    end        
    }

end
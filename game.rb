require './colorize.rb'
class Game
    attr_accessor :combination_size, :combination, :player, :rounds , :attempts
    def initialize
        @combination_size = combination_size 
        @combination = combination
        @attempts = attempts
        @rounds = rounds
    end
    def set_rules
        loop {
        puts "How many rounds this game should be (4 - 12) ? "
        number_of_rounds = gets.chomp.to_i
        @rounds = number_of_rounds
        if number_of_rounds > 3 && number_of_rounds < 13
            break
        else
            puts "Please Take note rounds must be 4 or more and 12 or less".red
        end
        }
        loop {
        puts "How many digits this code consist of (4 - 6) ? "
        number_of_digits = gets.chomp.to_i
        @combination_size = number_of_digits
        if number_of_digits > 3 && number_of_digits < 7
            break
        else
            puts "Please Take Note that Code length must be 4 to 6 digits"
        end
        }
    end

    def set_combination
        temp_arr = []
        attm = []
        combination_size.times {
            temp_arr.push(rand(1..6))
            attm << "X"
        }
        @attempts = attm
        @combination = temp_arr
    end

    def draw_feedback(guess,feedback,attempts)
        indicator = @attempts.clone
        counter = 0
        puts "-------------------"
        guess.each {|i| print "| #{i} "}
        puts ""
        puts "-------------------"        
        guess.each {|i| 
        if i == @combination[counter]
            indicator[counter] = "●"
        elsif feedback.include?(i)
            indicator[counter] = "○"
        else
            indicator[counter] = "X"            
        end
        counter +=1        
        }
        indicator.each {|i| print "| #{i} "}
        puts ""
        puts "-------------------"
    end
    
    def welcome
      puts "Please enlarge terminal window".blue
      puts "Welcome To"
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      puts ""
      puts "
 _____         _                 _       _ 
|     |___ ___| |_ ___ ___ _____|_|___ _| |
| | | | .'|_ -|  _| -_|  _|     | |   | . |
|_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|

".cyan
sleep(0.5)

puts "*** HOW TO PLAY THIS GAME ***".yellow
puts ""
puts "1 - You will be the codebreaker where you need to predict the secret code"
sleep (0.5)
puts ""
puts "2 - Each round you have to make a correct guess (consist of 4-6 digits) before your rounds are over"
puts ""
sleep (0.5)
puts "3 - After submitting a guess the computer will help you with a feedback symbols indicating each digit status"
puts ""
sleep (0.5)
puts "4 - Below each digit a status that indicates:"
puts ""
sleep(1)
puts "╔═════╦═════════════════════════════════════════════════════════╗".white_on_blue
puts "║  X  ║ digit does not exist in the code                        ║".white_on_blue            
puts "╚═════╩═════════════════════════════════════════════════════════╝".white_on_blue
puts "╔═════╦═════════════════════════════════════════════════════════╗".white_on_blue
puts "║  ○  ║ digit does exist in the code but with diffrent position ║" .white_on_blue           
puts "╚═════╩═════════════════════════════════════════════════════════╝".white_on_blue
puts "╔═════╦═════════════════════════════════════════════════════════╗".white_on_blue
puts "║  ●  ║ digit exist and in the correct position                 ║".white_on_blue            
puts "╚═════╩═════════════════════════════════════════════════════════╝".white_on_blue
puts ""
puts ""
sleep(1.5)
puts "△▽△▽△▽△▽△▽△▽△▽△▽△▽△▽△▽△".green
puts "The GAME Will Start NOW".yellow
puts "△▽△▽△▽△▽△▽△▽△▽△▽△▽△▽△▽△".green
puts ""
puts ""
    end


end

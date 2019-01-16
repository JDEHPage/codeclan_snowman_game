require_relative("game")
require_relative("player")
require_relative("hidden_word")

require('pry')

puts "Please type the word to guess:"

inputted_word = gets.chomp()

hidden_word = HiddenWord.new(inputted_word)

system 'clear'

puts "Please input player name:"
inputted_name = gets.chomp()

player = Player.new(inputted_name)

game = Game.new(player, hidden_word)

system 'clear'

puts "Hello #{player.name} You have #{player.lives} lives."

puts "Guess this word #{hidden_word.display}"

while player.lives != 0 && hidden_word.display != hidden_word.get_word

puts "Please type a letter:"
inputted_letter = gets.chomp()

game.guesses_letter(inputted_letter)


puts "#{player.name} You have #{player.lives} lives."
puts "You've guessed correctly #{hidden_word.display}"
puts "You've guessed incorrectly #{game.guessed_letters.join(", ")}"

end

puts "\n #{game.result}"

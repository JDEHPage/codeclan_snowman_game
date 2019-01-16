

class Game

  attr_reader :player, :hidden_word
  attr_accessor :guessed_letters

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def guesses_letter(letter)
    #is letter in hidden word?
    if @hidden_word.is_letter_in_word(letter)
      #if true then letter is added to display array
      @hidden_word.add_to_display(letter)
    else
      #else flase then @player loosed 1 life
      @player.looses_life()
      #letter goes to guessed letters array
      @guessed_letters.push(letter)
  end
end


def result()
return "You win" if   @hidden_word.get_word() == @hidden_word.display
return "You loose" if    @player.lives == 0
  end






end

require('pry')

class HiddenWord

  attr_reader :display

  def initialize(word)
    @word = word
    @display = word.split("").map{|letter| letter = "*"}.join()
  end

  def get_word
    return @word
  end

  def is_letter_in_word(letter)
    return @word.split("").include?(letter)
  end

  def add_to_display(letter)
  
    array = @word.split("")
    # find all instances of letter in the word
    indeces = array.each_index.select{|i| array[i] == letter}

    display_array = @display.split("")
    for i in indeces
      display_array[i] = letter
    end

    @display = display_array.join

    return @display
  end

end

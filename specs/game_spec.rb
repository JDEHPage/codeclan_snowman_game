require("minitest/autorun")
require("minitest/rg")
require_relative("../game")
require_relative("../player")
require_relative("../hidden_word")

require('pry')

class TestGame < MiniTest::Test
  def setup
    @player1 = Player.new("Mike")
    @hidden_word1 = HiddenWord.new("Snowman")
    @game = Game.new(@player1, @hidden_word1)
  end

  def test_game_has_player
    assert_equal(@player1, @game.player)
  end

  def test_game_has_a_hidden_word
    assert_equal(@hidden_word1, @game.hidden_word)
  end


  def test_player_guesses_letter
    @game.guesses_letter("n")
    assert_equal("*n****n", @hidden_word1.display)
    assert_equal(6, @player1.lives)
  end


  def test_player_guesses_letter_wrong
    @game.guesses_letter("z")
    assert_equal(true, @game.guessed_letters.include?("z"))
    assert_equal(1, @game.guessed_letters.count)
    assert_equal("*******", @hidden_word1.display)
    assert_equal(5, @player1.lives)
  end

def test_if_player_has_won_?
  @game.guesses_letter("S")
  @game.guesses_letter("n")
  @game.guesses_letter("o")
  @game.guesses_letter("w")
  @game.guesses_letter("m")
  @game.guesses_letter("a")
  assert_equal("You win", @game.result())
end

def test_if_player_has_lost_?
  @game.guesses_letter("r")
  @game.guesses_letter("t")
  @game.guesses_letter("c")
  @game.guesses_letter("b")
  @game.guesses_letter("q")
  @game.guesses_letter("y")
  assert_equal("You loose", @game.result())
end

end

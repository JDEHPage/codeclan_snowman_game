require("minitest/autorun")
require("minitest/rg")
require_relative("../hidden_word")

class TestHiddenWord < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("Snowman")
  end

  def test_hidden_has_a_word
    assert_equal("Snowman", @hidden_word.get_word())
  end

  def test_is_guessed_letter_in_word
    result = @hidden_word.is_letter_in_word("n")
    assert_equal(true, result)
  end

  def test_is_not_guessed_letter_in_word
    result = @hidden_word.is_letter_in_word("z")
    assert_equal(false, result)
  end

  def test_add_letter_to_display
    @hidden_word.add_to_display("n")
    assert_equal("*n****n", @hidden_word.display)
  end

end

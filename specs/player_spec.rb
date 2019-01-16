require("minitest/autorun")
require("minitest/rg")
require_relative("../player")

class TestPlayer < MiniTest::Test
  def setup
    @player = Player.new("Mike")
  end

  def test_player_has_name
    assert_equal("Mike", @player.name)
  end

  def test_player_looses_life
    @player.looses_life()
    assert_equal(5, @player.lives)
  end



end

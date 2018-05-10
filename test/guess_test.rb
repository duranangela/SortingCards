require "minitest/autorun"
require "minitest/pride"
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_it_has_a_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_it_has_a_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_is_response_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert guess.correct?
  end

  def test_it_gives_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_is_response_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    refute guess.correct?
  end

  def test_it_gives_different_feedback
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal "Incorrect.", guess.feedback
  end

end

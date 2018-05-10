require "minitest/autorun"
require "minitest/pride"
require "./lib/round"
require "./lib/card"
require "./lib/deck"
require "./lib/guess"
require "pry"

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_it_has_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_the_first_card_is_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_records_a_guess
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal round.record_guess("3 of Hearts"), round.guesses.last
  end

  def test_it_puts_guess_somewhere
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    assert_equal 1, round.guesses.count
  end

  def test_it_gives_proper_feedback
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_counts_number_correct
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    assert_equal 1, round.number_correct
  end

  def test_current_card_changes_after_guess
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    assert_equal card_2, round.current_card
  end

  def test_different_guess
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("Jack of Diamonds")
    assert_equal 2, round.guesses.count
  end

  def test_wrong_guess_feedback
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Jack of Diamonds")
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_number_correct_updates
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("Jack of Diamonds")
    assert_equal 1, round.number_correct
  end

  def test_it_gives_percent_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("3 of Hearts")
    round.record_guess("Jack of Diamonds")
    assert_equal 50, round.percent_correct
  end

end

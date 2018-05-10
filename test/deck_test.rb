require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/card"
require "pry"

class DeckTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_how_many_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
  end

  def test_it_sorts
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_2, card_1, card_3], deck.sort
  end

  def test_it_sorts_more_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("8", "Spades")
    card_5 = Card.new("6", "Hearts")
    card_6 = Card.new("7", "Clubs")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
    assert_equal [card_2, card_1, card_3, card_5, card_6, card_4], deck.sort
  end

end

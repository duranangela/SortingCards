require_relative "guess"

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @correct_answers = 0
  end

  def current_card
    deck.cards[0]
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    @guesses << guess
    number_correct
    deck.cards << deck.cards.shift
    guess
  end

  def number_correct
    if guesses.last.feedback == "Correct!"
      @correct_answers += 1
    end
    @correct_answers
  end

  def percent_correct
    (@correct_answers * 100) / @guesses.count
  end

end

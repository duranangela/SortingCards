class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def count
    @cards.count
  end

  def sort
    (@cards.length-1).times do |index|
      if @cards[index].value.to_i > @cards[index+1].value.to_i
        @cards[index], @cards[index+1] = @cards[index+1], @cards[index]
      end
    end 
    @cards
  end

end

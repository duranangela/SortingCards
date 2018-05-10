class Deck

  def initialize(card_array)
    @cards = card_array
  end

  def cards
    @cards
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

  def merge_sort #this method is ridiculously long - fix
    sorted_cards = []
    if @cards.length == 1
      sorted_cards = @cards
    end
    #split cards array
    middle = @cards.length/2
    left_cards = @cards.slice(0, middle)
    right_cards = @cards.slice(middle, @cards.length-middle)
    #compare cards
    index_l = 0
    index_r = 0
    while index_l < left_cards.length && index_r < right_cards.length
      l = left_cards[index_l].value.to_i
      r = right_cards[index_r].value.to_i
      if l <= r
        sorted_cards << left_cards[index_l]
        index_l += 1
      else
        sorted_cards << right_cards[index_r]
        index_r += 1
      end
    end
    #one card left in one of the arrays
    while index_l < left_cards.length
      sorted_cards << left_cards[index_l]
      index_l += 1
    end
    while index_r < right_cards.length
      sorted_cards << right_cards[index_r]
      index_r += 1
    end
    sorted_cards
  end

end

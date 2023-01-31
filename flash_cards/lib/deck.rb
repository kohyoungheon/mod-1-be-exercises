class Deck
  attr_accessor :array_of_cards
  def initialize(array_of_cards)
    @array_of_cards = array_of_cards
  end

  def cards
    @array_of_cards
  end

  def count
    @array_of_cards.count
  end

  def cards_in_category(category)
    return @array_of_cards.select {|card| card.category == category}
  end
end
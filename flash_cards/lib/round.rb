class Round
  attr_accessor :deck, :number_correct, :number_incorrect, :category_hash
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_incorrect = 0
    @category_hash= Hash.new
    @category_hash[:Geography] = 0
    @category_hash[:STEM] = 0
    
  end

  def deck
    @deck
  end

  def turns
    @turns
  end
  def current_card
    return deck.cards[0]
  end
  def take_turn(player_guess)
    turn = Turn.new(player_guess,deck.cards[0])
    if player_guess == deck.cards[0].answer
      @number_correct += 1
      @category_hash[@deck.cards[0].category] += 1
    else
      @number_incorrect +=1
      @category_hash[@deck.cards[0].category] += 1
    end
      @turns.push(turn)
      deck.array_of_cards.shift
    return turn
  end

  def number_correct_by_category(category)
    @category_hash[category] / turns.length

  end

  def percent_correct
    integer_correct = @number_correct / turns.length * 100
  end

  def percent_correct_by_category(category)
    turns.each do |trn|
      if trn.current_card.answer == trn.user_guess
        @category_hash[trn.current_card.category] += 1
      end
    end
    percentage = @category_hash[category] / turns.length
    puts percentage.to_f * 100
  end

  def current_card
    @deck.array_of_cards[0]
  end
end
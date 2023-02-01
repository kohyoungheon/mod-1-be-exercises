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
    @correct_by_category_hash = Hash.new
    @correct_by_category_hash[:Geography] = 0
    @correct_by_category_hash[:STEM] = 0
    @counter = 0
    
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
    turn = Turn.new(player_guess,deck.cards[@counter])
    if player_guess == deck.cards[@counter].answer
      @number_correct += 1
      @category_hash[@deck.cards[@counter].category] += 1
      @counter += 1
    else
      @number_incorrect +=1
      @category_hash[@deck.cards[@counter].category] += 1
      @counter +=1
    end
      @turns << turn
      
      # deck.array_of_cards.shift
    return turn
  end

  def number_correct_by_category(category)
    @category_hash[category] 

  end

  def percent_correct
    decimal_correct = (number_correct.to_f / turns.length)
    decimal_correct * 100
  end

  def calculate_category_percentage
    turns.each do |trn|
      if trn.current_card.answer == trn.user_guess
        @correct_by_category_hash[trn.current_card.category] += 1
      end
    end
  end
  
  def percent_correct_by_category(category)
    percentage = @correct_by_category_hash[category].to_f / @category_hash[category]
    require 'pry'; binding.pry
    return percentage.to_f * 100
    
    
  end

  def current_card
    @deck.array_of_cards[0]
  end
end
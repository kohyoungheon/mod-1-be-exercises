require './card'
require './deck'
require './round'
require './turn'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_4 = Card.new("Which element has 8 protons?","Oxygen",:STEM)
# card_5 = Card.new("What is the square root of 4?","16",:STEM)
# card_6 = Card.new("What is the sum of all numbers 1-100?","5050",:STEM)
# card_7 = Card.new("Simplify this fraction 242/1452","1/6",:STEM)
# card_8 = Card.new("What is the Capital of Brunei?","Bandar Seri Begawan",:Geography)
# card_9 = Card.new("How many continents exist on Earth?","",:Geography)
# card_10 = Card.new("What is the largest continent by landmass?","Asia",:Geography)
# deck1 = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10])
# round = Round.new(deck1)
# require 'pry'; binding.pry
def start
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("What is the capital of Japan?", "Tokyo", :Geography)
  card_4 = Card.new("Which element has 8 protons?","Oxygen",:STEM)
  card_5 = Card.new("What is the square root of 4?","16",:STEM)
  card_6 = Card.new("What is the sum of all numbers 1-100?","5050",:STEM)
  card_7 = Card.new("Simplify this fraction 242/1452","1/6",:STEM)
  card_8 = Card.new("What is the Capital of Brunei?","Bandar Seri Begawan",:Geography)
  card_9 = Card.new("How many continents exist on Earth?","7",:Geography)
  card_10 = Card.new("What is the largest continent by landmass?","Asia",:Geography)
  deck1 = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10])
  round1 = Round.new(deck1)
  card_counter = 1
  total_cards = deck1.count
  puts "Welcome! You're playing with #{deck1.count} cards."
  puts "______________________________________________"
  deck1.array_of_cards.each do |card|
    puts "This is card number #{card_counter} out of #{total_cards}"
    puts card.question
    user_answer = gets.chomp
    round1.take_turn(user_answer)
    card_counter += 1
  end
  puts "****** Game over! ******"
  puts "You had #{round1.number_correct} correct guesses out of #{total_cards} for a total score of #{round1.percent_correct}% "
  round1.calculate_category_percentage()
  puts "STEM - #{round1.percent_correct_by_category(:STEM)}% correct." 
  puts "Geography - #{round1.percent_correct_by_category(:Geography)}% correct."
  
end

start()
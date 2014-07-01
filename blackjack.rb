
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Clubs", "Spades", "Diamonds"]
deck = cards.product(suits).shuffle

player_hand = []
computer_hand = []

player_hand << deck.pop
computer_hand << deck.pop
player_hand << deck.pop
computer_hand << deck.pop

def calculate_total(cards)
  arr = cards.map {|e| e[1].to_i}
  total = 0
  arr.each do |value|
    if value == 0
      total += 10
    else
      total += value
    end
  end
end

puts "Here is your hand:"
player_hand.each do |card|
  puts "#{card.first} of #{card.last}"
  end
  puts ' '
  puts "What do you want to do? 
  (1) Stay
  (2) Hit"
  player_action = gets.chomp
  if player_action == "2"
    player_hand << deck.pop
    puts "Here is your hand:"
    player_hand.each do |card|
    puts "#{card.first} of #{card.last}"
    end
  elsif player_action == "1"
    puts "Here is your hand:"
    player_hand.each do |card|
    puts "#{card.first} of #{card.last}"
  end
end



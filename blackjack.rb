
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
  arr = cards.map {|e| e[0].to_i}
  total = 0
  arr.each do |value|
    if value == "Ace"
      if total <= 10
        total += 11
      elsif total > 10
        total += 1
      end
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  total
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

computer_total = calculate_total(computer_hand)
player_total = calculate_total(player_hand)
puts ' '
puts "Dealer has #{computer_total}"
puts "You have #{player_total}"

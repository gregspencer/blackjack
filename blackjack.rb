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
  arr = cards.map{|e| e[0]}
  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  arr.select{|n| n == "Ace"}.count.times do
    if total > 21
      total -= 10
    end
  end
  total
end

player_total = calculate_total(player_hand)
dealer_total = calculate_total(computer_hand)
puts ''
puts "Here is computer hand:"
computer_hand.each do |card|
  puts "#{card.first} of #{card.last}"
  end
puts "for a total of #{dealer_total}"
puts ''
puts "Here is your hand:"
player_hand.each do |card|
  puts "#{card.first} of #{card.last}"
  end
puts "for a total of #{player_total}"

# Player turn
if player_total == 21
  puts "Congratulations, you hit blackjack!  You win!"
  exit
end


while player_total < 21
  puts ' '
  puts "What do you want to do? 
(1) Stay
(2) Hit"
  player_action = gets.chomp
  if !["1", "2"].include?(player_action)
    puts "you must enter a 1 or 2"
    next
  end
  if player_action == "1"
    puts "You chose to stay"
    break
  end

  new_card = deck.pop
  player_hand << new_card
  puts "Dealing card #{new_card.first} of #{new_card.last} to player"
  player_total = calculate_total(player_hand)
  puts "Your total is now: #{player_total}"
  if player_total == 21
  puts "Congratulations, you hit blackjack!  You win!"
  exit
  elsif player_total > 21
    puts "You busted!"
    exit
  end
end

# Dealer turn
if dealer_total == 21
  puts "Sorry, dealer hit blackjack.  You lose."
  exit
end


while dealer_total <= 17
  new_card = deck.pop
  computer_hand << new_card
  puts "Dealer got card #{new_card.first} of #{new_card.last}"
  dealer_total = calculate_total(computer_hand)
  puts "Dealer total is now #{dealer_total}"
  if dealer_total == 21
  puts "Sorry, dealer hit blackjack.  You lose."
  exit
  elsif dealer_total > 21
    puts "Dealer busted.  You win!"
    exit
  end
end

# Compare hands

if dealer_total > player_total
 puts "Sorry, dealer wins." 
elsif dealer_total < player_total
  puts "Congratulations, you win!"
else
  puts "It's a tie."
end


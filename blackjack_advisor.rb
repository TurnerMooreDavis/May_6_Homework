puts "whats your first card?"
first_card = gets.chomp.upcase
puts "and your second?"
second_card = gets.chomp.upcase
puts "whats the dealers card?"
dealers_card= gets.chomp.upcase

def convert_input (card)
  if card == "K" || card == "Q" || card == "J"
    return 10
  elsif card == "A"
    return "A"
  else
    return card.to_i
  end
end



cards = {
  "users_hand" => {
    "first_card" => convert_input(first_card),
    "second_card" => convert_input(second_card)},
  "dealers_card" => convert_input(dealers_card)
}

p cards

puts "whats your first card?"
first_card = gets.chomp.to_i
puts "and your second?"
second_card = gets.chomp.to_i
puts "whats the dealers card?"
dealers_card= gets.chomp.to_i

cards = {
  "users_hand" => {
    "first_card" => first_card,
    "second_card" => second_card},
  "dealers_card" => dealers_card
}

p cards

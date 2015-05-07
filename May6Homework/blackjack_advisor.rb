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

def find_hand_type (first, second)
  if first == second
    return "pair"
  elsif first == "A" || second == "A"
    return "soft"
  else
    return "hard"
  end
end

hard = {
  2..3 => {5..8 => "Hit", 9..11 => "Double or Hit", 12 => "Hit", 13..21 => "Stand"},
  4 => {5..8 => "Hit", 9..11 => "Double or Hit", 12..21 => "Stand"},
  5..6 => {5..7 => "Hit", 8..11 => "Double or Hit", 12..21 => "Stand"},
  7..9 => {5..9 => "Hit", 10..11 => "Double or Hit", 12..16 => "Hit", 17..21 => "Stand"},
  10 => {5..10 => "Hit", 11 => "Double or Hit", 12..16 => "Hit", 17..21 => "Stand"},
  "A" => {5..10 => "Hit", 11 => "Double or Hit", 12..16 => "Hit", 17..21 => "Stand"}
}
puts cards["dealers_card"]
hand = hard.select { |dealer| dealer === cards["dealers_card"] }.values.first
puts hand
total_hand = cards["users_hand"]["first_card"] + cards["users_hand"]["second_card"]
answer = hand.select { |hand| hand === total_hand }.values.first
puts answer

soft = {
  2 => {13..16 => "Hit", 17 => "Double or Hit", 18..21 => "Stand"},
  3 => {13..16 => "Hit", 17 => "Double or Hit", 18 => "Double or Stand" 19..21 => "Stand"},
  4..5 => {13..17 => "Double or Hit", 18 => "Double or Stand" 19..21 => "Stand"},
  6 => {13..17 => "Double or Hit", 18..19 => "Double or Stand" 20..21 => "Stand"},
  7..8 => {13..17 => "Hit", 18..21 => "Stand"},
  9..10 => {13..19 => "Hit", 20..21 => "Stand"},
  "A" => {13..17 => "Hit", 18..21 => "Stand"},
}

pair = {
  2..3 => {2..3 => "Split", 4 => "Hit", 5 => "Double or Hit", 6..9 => "Split",10 => "Stand","A" => "Split"},
  4..6 => {2..4 => "Split", 5 => "Double or Hit", 6..9 => "Split",10 => "Stand","A" => "Split"},
  7 => {2..3 => "Split", 4 => "Hit", 5 => "Double or Hit", 6..9 => "Split",10 => "Stand","A" => "Split"},
  8 => {2 => "Hit", 3 => "Split", 4 => "Hit", 5 => "Double or Hit", 6 => "Hit", 7..9 => "Split",10 => "Stand","A" => "Split"},
  9 => {2..4 =>"Hit", 5 => "Double or Hit", 6..7 => "Hit",8..9 => "Split",10 => "Stand","A" => "Split"},
  10 => {2..6 =>"Hit", 7 => "Split",8 => "Pair",9..10 => "Stand","A" => "Split"},
  "A" => {2..7 =>"Hit",8 => "Pair",9..10 => "Stand","A" => "Split"},
}

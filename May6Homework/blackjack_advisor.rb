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

hard = {
  2..3 => {5..8 => "Hit", 9..11 => "Double or Hit", 12 => "Hit", 13..21 => "Stand"},
  4 => {5..8 => "Hit", 9..11 => "Double or Hit", 12..21 => "Stand"},
  5..6 => {5..7 => "Hit", 8..11 => "Double or Hit", 12..21 => "Stand"},
  7..9 => {5..9 => "Hit", 10..11 => "Double or Hit", 12..16 => "Hit", 17..21 => "Stand"},
  10 => {5..10 => "Hit", 11 => "Double or Hit", 12..16 => "Hit", 17..21 => "Stand"},
  "A" => {5..10 => "Hit", 11 => "Double or Hit", 12..16 => "Hit", 17..21 => "Stand"}
}


soft = {
  2 => {13..16 => "Hit", 17 => "Double or Hit", 18..21 => "Stand"},
  3 => {13..16 => "Hit", 17 => "Double or Hit", 18 => "Double or Stand", 19..21 => "Stand"},
  4..5 => {13..17 => "Double or Hit", 18 => "Double or Stand", 19..21 => "Stand"},
  6 => {13..17 => "Double or Hit", 18..19 => "Double or Stand", 20..21 => "Stand"},
  7..8 => {13..17 => "Hit", 18..21 => "Stand"},
  9..10 => {13..19 => "Hit", 20..21 => "Stand"},
  "A" => {13..17 => "Hit", 18..21 => "Stand"}
}

pair = {
  2..3 => {4..6 => "Split", 8 => "Hit", 10 => "Double or Hit", 12..18 => "Split",20 => "Stand",22 => "Split"},
  3..6 => {4..8 => "Split", 10 => "Double or Hit", 12..18 => "Split",20 => "Stand",22 => "Split"},
  7 => {2..3 => "Split", 4 => "Hit", 5 => "Double or Hit", 6..9 => "Split",20 => "Stand",22 => "Split"},
  8 => {4 => "Hit", 6 => "Split", 8 => "Hit", 5 => "Double or Hit", 12 => "Hit", 14..18 => "Split",20 => "Stand",22 => "Split"},
  9 => {4..8 =>"Hit", 10 => "Double or Hit", 12..14 => "Hit",16..18 => "Split",20 => "Stand",22 => "Split"},
  10 => {4..12 =>"Hit", 14 => "Split",16 => "Pair",18..20 => "Stand",22 => "Split"},
  "A" => {4..8 =>"Hit",16 => "Pair",18..20 => "Stand",22 => "Split"},
}

def find_hand_type (first, second, dealer, cards)
  if second == "A" && first == "A"
    cards["users_hand"]["first_card"] = 11
    cards["users_hand"]["second_card"] = 11
    return "pair"
  elsif first == "A"
    cards["users_hand"]["first_card"] = 11
    return "soft"
  elsif second == "A"
    cards["users_hand"]["second_card"] = 11
    return "soft"
  elsif first == second
      return "pair"
  else
    return "hard"
  end
end

def make_suggestion (hand_type, cards)
  hand = hand_type.select { |dealer| dealer === cards["dealers_card"] }.values.first
  total_hand = cards["users_hand"]["first_card"] + cards["users_hand"]["second_card"]
  answer = hand.select { |hand| hand === total_hand }.values.first
end



hand_type = find_hand_type(cards["users_hand"]["first_card"],cards["users_hand"]["second_card"],cards["dealers_card"],cards)
if hand_type == "pair"
  suggestion = make_suggestion(pair, cards)
elsif hand_type == "soft"
  suggestion = make_suggestion(soft, cards)
else
  suggestion = make_suggestion(hard, cards)
end
puts suggestion

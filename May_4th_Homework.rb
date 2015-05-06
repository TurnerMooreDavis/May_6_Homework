numbers = []
counter = 0
total = 0
final_response = false
while final_response == false
  puts "Please enter a number:"
  input = gets.chomp
  characters = input.split(//)
  not_a_number = false
  characters.each do |c|
    if !(c == "0" || c == "1" || c == "2" || c == "3" || c == "4" || c == "5" || c == "6" || c == "7" || c == "8" || c == "9" || c == "." || c == "-")
      not_a_number = true
    end
  end
  if input == ""
    final_response = true
    break
  elsif not_a_number == true
    puts "Your input was not a number, please try again"
  else
    add_me_in = input.to_f
    numbers.push(add_me_in)
    counter +=1
  end
end
numbers.each do |number|
  total += number
end
average = total/counter
puts "Total:#{total} Average:#{average}"

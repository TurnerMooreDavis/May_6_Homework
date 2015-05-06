answer = rand (1..100)
puts "I have chosen a number between 1 and 100.  What is it?"
past_guesses = [answer+100]
guess = true
while guess
  guess = gets.chomp.to_i
  guess_diff = (answer - guess).abs
  past_diff = (answer - past_guesses.last).abs
  if guess == answer
    puts "Correct!  Well played good sir"
  break
  break
  elsif guess_diff > past_diff
    puts "Colder :( You were doing so well!"
  elsif guess_diff == past_diff
    puts "Come on, you just guessed that"
  elsif 11 <= (guess-answer) && (guess-answer)<= 20
    puts "Getting warm.  Go even lower"
  elsif 4 <= (guess-answer) && (guess-answer)<= 10
    puts "Mmmm...toasty!! just a bit lower"
  elsif 1 <= (guess-answer) && (guess-answer)<= 3
    puts "Hot!!! so close, just liiitle lower!"
  elsif 11 <= (answer-guess) && (answer-guess)<= 20
    puts "Getting warm.  Go even higher"
  elsif 4 <= (answer-guess) && (answer-guess)<= 10
    puts "Mmmm...toasty!! just a bit higher"
  elsif 1 <= (answer-guess) && (answer-guess)<= 3
    puts "Hot!!! so close, just a liiitle higher!"
  elsif guess < answer
    puts "Nope, you're too low"
  elsif guess > answer
    puts "Too high man, you're just too high"
  end
  past_guesses << guess
end

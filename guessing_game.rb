answer = rand (1..100)
puts "I have chosen a number between 1 and 100.  Care to take a guess?"
past_guesses = [answer+100]
counter = 0


def check_past (guess,answer,past_guesses)
  guess_diff = (answer - guess).abs
  past_diff = (answer - past_guesses.last).abs
  if guess_diff > past_diff
    puts "Colder :( You were doing so well!"
    return true
  elsif guess == past_guesses.last
    puts "Come on, you just guessed that"
    return true
  end
  return false
end



def up_or_down (guess,answer)
  if 11 <= (guess-answer) && (guess-answer)<= 20
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
end

(1..5).each do |num|
  guess = gets.chomp.to_i
  if answer == guess
    puts "You are correct.  Well played my friend!"
    break
    break
  else
    result = check_past(guess,answer,past_guesses)
    past_guesses << guess
  end
  if !result
    up_or_down(guess,answer)
  end
  guesses_left = 5-num
  puts "#{guesses_left} guesses left"
  if num == 5
    puts "...and you're out of tries.  I win :).  Answer:#{answer}"
  end
end

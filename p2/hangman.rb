#!/usr/bin/env ruby

$chances = 9
$ended = false

puts "Enter word length between 5 and 20: "
length = gets.to_i
if length < 5 then length = 5 end
if length > 20 then length = 20 end

words = IO.read("words").split("\n")
words.keep_if {|x| x.length == length}

$guesses = Array.new

def take_guess(letter)
  if $guesses.include?(letter) then
    puts "Already guessed that letter, try again: "
    return false
  else
    $guesses.push(letter)
    $chances = $chances-1
    if $chances == 0 then
      $ended = true
      return false
    end
    return true
  end
end

def check_words(letter)
  puts "in check_words"
end

while !($ended) do
  puts "enter your guess: "
  guess = gets.chomp
  if take_guess(guess) then
    check_words(guess)
  end

end


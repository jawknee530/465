#!/usr/bin/env ruby

$chances = 9
$ended = false
$empty = false
$target = "a"

puts "Enter word length between 5 and 20: "
length = gets.to_i
if length < 5 then length = 5 end
if length > 20 then length = 20 end

words = IO.read("words").split("\n")
words.keep_if {|x| x.length == length}

$guesses = Array.new

def take_guess(letter)
  if letter.length > 1 then
    puts "Enter a single character, try again: "
    return false
  elsif $guesses.include?(letter) then
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

def check_words(letter, words2)
  temp = []
  temp = words2.map do |x| x.dup end
  words2.map! {|x| if x =~ /#{letter}/ then nil else x end}.compact!
  if words2.any? then
    $empty = false 
    return words2
  else
    $empty = true
    return temp
  end
end

while !($ended) do
  puts "enter your guess: "
  guess = gets.chomp
  if take_guess(guess) then
    if $target == "a" then
      temp = []
      temp = check_words(guess, words)
      if $empty then
        words = temp.map do |x| x.dup end
        $target = words[0]
      end
    end
  end

end


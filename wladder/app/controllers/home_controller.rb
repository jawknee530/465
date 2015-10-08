class HomeController < ApplicationController

load "#{Rails.root}/lib/ladder.rb"

def index
  @word1 = dictionary.sample
  @word2 = dictionary.sample
  while @word1 == @word2 do
    @word1 = dictionary.sample
    @word2 = dictionary.sample
  end
end

def show
  @start = params[:start_word]
  @word1 = params[:word1]
  @word2 = params[:word2]
  @word3 = params[:word3]
  @word4 = params[:word4]
  @word5 = params[:word5]
  @end = params[:end_word]
  a = [@start, @word1, @word2, @word3, @word4, @word5, @end] 
  a.keep_if {|v| !v.empty?}
  if (legal a)
    @result = "Congrats you won"
  else
    @result = "Sorry you lose"
  end

end

end

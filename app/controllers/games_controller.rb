require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    # raise
    @word = params[:word]
    # binding.pry
    json = open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    ruby_hash = JSON.parse(json)

    if ruby_hash[:found] == true
      @answer = '<strong>Congratulations!</strong> DUNE is the a valid English word!'
    elsif ruby_hash[:found] == false
      @answer = "Sorry but #{@word} does not seems"
    else
      @answer = "Sorry but #{@word} can't be built out of #{@letters}"
    end
  end
end

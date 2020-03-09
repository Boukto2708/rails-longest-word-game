require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    @grid = params[:grid]
    @maxime = english_word?(@word)
    @greg = grid_include?(@letters, @word)
  end

  def english_word?(word)
    maman = "https://wagon-dictionary.herokuapp.com/#{word}"
    cassandre = open(maman).read
    result = JSON.parse(cassandre)
    result['found']
  end

  def grid_include?(letters, word)
    papa = []
    word.split('').each do |letter|
      papa << (word.count(letter.capitalize) <= letters.split(' ').count(letter))
    end
    if papa.include?(false)
      false
    else
      true
    end
  end
end

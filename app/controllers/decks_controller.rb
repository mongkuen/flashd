class DecksController < ApplicationController
  def index
    @decks = Deck.recent_decks
  end

  def new
    @deck = Deck.new
  end
end

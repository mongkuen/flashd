class DecksController < ApplicationController
  before_action :require_user_signup, only: [:new]

  def index
    @decks = Deck.recent_decks
  end

  def new
    @deck = Deck.new
  end
end

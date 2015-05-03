class CardsController < ApplicationController
  before_action :require_user_signup, only: [:new]

  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end

  def new
    @card = Card.new
  end
end

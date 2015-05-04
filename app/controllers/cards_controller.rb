class CardsController < ApplicationController
  before_action :set_deck, only: [:index, :new, :create]
  before_action :require_user_signup, only: [:new, :create]
  before_action only: [:new, :create] do
    deny_access(@deck)
  end

  def index
    @cards = @deck.cards
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = @deck.user
    @card.deck = @deck

    if @card.save
      redirect_to deck_cards_path(@deck)
    else
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private
  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:title, :heading, :description, :img_url)
  end
end

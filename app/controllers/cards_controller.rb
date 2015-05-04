class CardsController < ApplicationController
  before_action :set_deck, except: [:show]
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :require_user_signup, only: [:new, :create]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action except: [:show, :index] do
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

  def show; end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to deck_cards_path(@deck)
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to deck_cards_path(@deck)
  end

  private
  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:title, :heading, :description, :img_url)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end

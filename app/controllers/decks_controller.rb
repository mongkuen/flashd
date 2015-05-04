class DecksController < ApplicationController
  before_action :require_user_signup, only: [:new, :create]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    deny_access(@deck)
  end

  def index
    # @decks = Deck.recent_decks
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      redirect_to deck_cards_path(@deck)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @deck.update(deck_params)
      redirect_to deck_path(@deck)
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to root_path
  end

  private
  def deck_params
    params.require(:deck).permit(:name, :img_url)
  end

  def set_deck
    @deck = Deck.find(params[:id]) if Deck.exists?(params[:id])
  end
end

class DecksController < ApplicationController
  before_action :require_user_signup, only: [:new, :create]

  def index
    @decks = Deck.recent_decks
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

  # def show
  #   @deck = Deck.find(params[:id])
  # end

  private
  def deck_params
    params.require(:deck).permit(:name, :img_url)
  end
end

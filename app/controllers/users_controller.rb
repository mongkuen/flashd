class UsersController < ApplicationController
  before_action :hide_from_user, only: [:new, :create]
  before_action :require_user, only: [:my_cards]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def my_cards
    @decks = current_user.decks
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

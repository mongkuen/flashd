require 'rails_helper'

describe DecksController do
  describe "GET index" do
    it "sets @decks" do
      deck = Fabricate(:deck)
      get :index
      expect(assigns(:decks)).to eq([deck])
    end

    it "renders index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    it "sets new @deck" do
      get :new
      expect(assigns(:deck)).to be_instance_of(Deck)
    end

    it "renders new" do
      get :new
      expect(response).to render_template :new
    end
  end
end

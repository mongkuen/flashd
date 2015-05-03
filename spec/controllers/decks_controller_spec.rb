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
    context "logged_in" do
      before { set_current_user }

      it "sets new @deck" do
        get :new
        expect(assigns(:deck)).to be_a_new(Deck)
      end

      it "renders new" do
        get :new
        expect(response).to render_template :new
      end
   end

    it_behaves_like "require user signup" do
      let(:action) { get :new }
    end
  end
end

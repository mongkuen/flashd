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

  describe "POST create" do
    context "valid deck" do
      let(:deck) { Fabricate.attributes_for(:deck) }
      before do
        set_current_user
        post :create, deck: deck
      end

      it "creates new deck variable" do
        expect(assigns(:deck).name).to eq(deck[:name])
      end

      it "new deck should belong to current user" do
        expect(assigns(:deck).user).to eq(current_user)
      end

      it "creates new deck" do
        expect(Deck.count).to eq(1)
      end

      it "redirects to deck cards index" do
        expect(response).to redirect_to deck_cards_path(Deck.first.id)
      end
    end

    context "invalid deck" do
      let(:deck) { Fabricate.attributes_for(:deck, name: "") }
      before do
        set_current_user
        post :create, deck: deck
      end

      it "does not create new deck" do
        expect(Deck.count).to eq(0)
      end
      it "renders new template" do
        expect(response).to render_template :new
      end
    end

    it_behaves_like "require user signup" do
      let(:action) { post :create }
    end
  end

  # describe "GET show" do
  #   let(:deck) { Fabricate(:deck) }
  #   before do
  #     get :show, id: deck.id
  #   end

  #   it "sets deck" do
  #     expect(assigns(:deck)).to eq(deck)
  #   end

  #   it "renders show template" do
  #     expect(response).to render_template :show
  #   end
  # end
end

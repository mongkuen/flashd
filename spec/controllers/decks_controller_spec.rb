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

  describe "GET show" do
    let(:deck) { Fabricate(:deck) }
    before { get :show, id: deck.id }

    it "sets deck" do
      expect(assigns(:deck)).to eq(deck)
    end

    it "renders show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET edit" do
    before { set_current_user }

    it "sets @deck" do
      deck = Fabricate(:deck)
      get :edit, id: deck.id
      expect(assigns(:deck).name).to eq(deck.name)
    end

    it "wrong user access denied" do
      user_2 = Fabricate(:user)
      deck_2 = Fabricate(:deck, user: user_2)
      get :edit, id: deck_2.id
      expect(response).to redirect_to root_path
    end

    it_behaves_like "require user" do
      let(:action) do
        deck = Fabricate(:deck)
        get :edit, id: deck.id
      end
    end
  end

  describe "PATCH update" do
    before { set_current_user }

    it "sets @deck" do
      deck = Fabricate(:deck)
      patch :update, id: deck.id
      expect(assigns(:deck).name).to eq(deck.name)
    end

    context "update valid" do
      let(:deck) { Fabricate(:deck, user: current_user) }
      let(:edit_deck) { Fabricate.attributes_for(:deck) }

      it "updates deck" do
        patch :update, id: deck.id, deck: edit_deck
        expect(Deck.first.name).to eq(edit_deck[:name])
      end

      it "redirects to deck path" do
        patch :update, id: deck.id, deck: edit_deck
        expect(response).to redirect_to deck_path(deck)
      end
    end

    context "update invalid" do
      let(:deck) { Fabricate(:deck, user: current_user) }
      let(:edit_deck) { Fabricate.attributes_for(:deck, name: "") }

      it "does not update deck" do
        patch :update, id: deck.id, deck: edit_deck
        expect(Deck.first.name).to eq(deck.name)
      end

      it "renders edit" do
        patch :update, id: deck.id, deck: edit_deck
        expect(response).to render_template :edit
      end
    end

    it "wrong user access denied" do
      user_2 = Fabricate(:user)
      deck_2 = Fabricate(:deck, user: user_2)
      patch :update, id: deck_2.id
      expect(response).to redirect_to root_path
    end

    it_behaves_like "require user" do
      let(:action) do
        deck = Fabricate(:deck)
        patch :update, id: deck.id
      end
    end
  end

  describe "DELETE destroy" do
    before { set_current_user }

    it "sets @deck" do
      deck = Fabricate(:deck)
      delete :destroy, id: deck.id
      expect(assigns(:deck).name).to eq(deck.name)
    end

    it "deletes deck" do
      deck = Fabricate(:deck, user: current_user)
      delete :destroy, id: deck.id
      expect(Deck.count).to eq(0)
    end

    it "wrong user access denied" do
      user_2 = Fabricate(:user)
      deck_2 = Fabricate(:deck, user: user_2)
      delete :destroy, id: deck_2.id
      expect(response).to redirect_to root_path
    end

    it_behaves_like "require user" do
      let(:action) do
        deck = Fabricate(:deck)
        delete :destroy, id: deck.id
      end
    end
  end
end

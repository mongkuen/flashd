require 'rails_helper'

describe CardsController do
  describe "GET index" do
    let(:deck) { Fabricate(:deck) }
    before { get :index, deck_id: deck.id }

    it "should set @deck" do
      expect(assigns(:deck).id).to eq(Deck.first.id)
    end

    it "should set @cards" do
      card_1 = Fabricate(:card, deck: deck)
      card_2 = Fabricate(:card, deck: deck)
      expect(assigns(:cards).count).to eq(2)
    end

    it "should render index" do
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    context "logged_in" do
      let(:deck) { Fabricate(:deck, user: current_user) }
      before do
        set_current_user
        get :new, deck_id: deck.id
      end

      it "sets new @card" do
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "sets @deck" do
        expect(assigns(:deck).id).to be(deck.id)
      end

      it "renders new" do
        expect(response).to render_template :new
      end

      it "wrong user access denied" do
        user_2 = Fabricate(:user)
        deck_2 = Fabricate(:deck, user: user_2)
        get :new, deck_id: deck_2.id
        expect(response).to redirect_to root_path
      end
    end

    it_behaves_like "require user signup" do
      let(:action) do
        deck = Fabricate(:deck)
        get :new, deck_id: deck.id
      end
    end
  end

  describe "POST create" do
    let(:deck) { Fabricate(:deck, user: current_user) }
    let(:card) { Fabricate.attributes_for(:card, deck: deck, user: current_user) }
    before { set_current_user }

    context "valid card" do
      before { post :create, deck_id: deck.id, card: card }

      it "creates new card variable" do
        expect(assigns(:card).title).to eq(card[:title])
      end

      it "new card should belong to current user" do
        expect(assigns(:card).user).to eq(current_user)
      end

      it "new card should belong to deck" do
        expect(assigns(:card).deck).to eq(deck)
      end

      it "creates new card" do
        expect(Card.count).to eq(1)
      end

      it "redirects to deck cards index" do
        expect(response).to redirect_to deck_cards_path(Deck.first.id)
      end
    end

    context "invalid card" do
      let(:card) { Fabricate.attributes_for(:card, title: "") }
      before { post :create, deck_id: deck.id, card: card }

      it "does not create new card" do
        expect(Card.count).to eq(0)
      end

      it "renders new template" do
        expect(response).to render_template :new
      end
    end

    it "sets @deck" do
      post :create, deck_id: deck.id, card: card
      expect(assigns(:deck).id).to be(deck.id)
    end

    it "wrong user access denied" do
      user_2 = Fabricate(:user)
      deck_2 = Fabricate(:deck, user: user_2)
      post :create, deck_id: deck_2.id, card: card
      expect(response).to redirect_to root_path
    end

    it_behaves_like "require user signup" do
      let(:action) do
        deck = Fabricate(:deck)
        post :create, deck_id: deck.id
      end
    end
  end

  describe "GET show" do
    let(:deck) { Fabricate(:deck) }
    let(:card) { Fabricate(:card, deck: deck) }
    before { get :show, deck_id: deck.id, id: card.id }

    it "sets card" do
      expect(assigns(:card)).to eq(card)
    end

    it "renders show template" do
      expect(response).to render_template :show
    end
  end
end

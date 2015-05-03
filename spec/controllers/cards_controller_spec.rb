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
      let(:deck) { Fabricate(:deck) }
      before do
        set_current_user
        get :new, deck_id: deck.id
      end

      it "sets new @card" do
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "renders new" do
        expect(response).to render_template :new
      end
   end

    it_behaves_like "require user signup" do
      let(:action) do
        deck = Fabricate(:deck)
        get :new, deck_id: deck.id
      end
    end
  end
end

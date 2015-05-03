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
end

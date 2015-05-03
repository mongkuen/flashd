require 'rails_helper'

describe Deck do
  it { should validate_presence_of :name }
  it { should validate_presence_of :user }
  it { should belong_to :user }
  it { should have_many :cards }

  describe "#recent_decks" do
    it "should return deck objects" do
      deck = Fabricate(:deck)
      expect(Deck.recent_decks).to eq([deck])
    end

    it "should return all decks if less than 30" do
      5.times do
        Fabricate(:deck)
      end
      expect(Deck.recent_decks.count).to eq(5)
    end

    it "should return only 30 decks if more than 30" do
      50.times do
        Fabricate(:deck)
      end
      expect(Deck.recent_decks.count).to eq(30)
    end

    it "should return decks by most recent first" do
      deck_old = Fabricate(:deck, created_at: 5.day.ago)
      deck_new = Fabricate(:deck)
      expect(Deck.recent_decks).to eq([deck_new, deck_old])
    end
  end
end

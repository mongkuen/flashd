require 'rails_helper'

feature 'card index +new card button' do
  let(:user) { Fabricate(:user) }
  background { sign_in(user) }

  scenario "show button if deck belongs to current user" do
    deck = Fabricate(:deck, user: user)
    visit deck_cards_path(deck)
    expect(page).to have_content("New Card")
  end

  scenario "hide button if deck does not belong to current user" do
    user_2 = Fabricate(:user)
    deck = Fabricate(:deck, user: user_2)
    visit deck_cards_path(deck)
    expect(page).not_to have_content("New Card")
  end
end

require 'rails_helper'

feature "edit deck" do
  let(:user) { Fabricate(:user) }

  scenario "shows edit/delete if deck belongs to current_user" do
    deck = Fabricate(:deck, user: user)
    sign_in(user)
    visit deck_path(Deck.first)
    expect(page).to have_content("Edit Deck")
  end

  scenario "hides edit/delete if deck does not belong to current_user" do
    user_2 = Fabricate(:user)
    deck = Fabricate(:deck, user: user_2)
    sign_in(user)
    visit deck_path(Deck.first)
    expect(page).not_to have_content("Edit Deck")
    expect(page).not_to have_content("Delete Deck")
  end
end

feature "deck form behavior" do
  let(:user) { Fabricate(:user) }
  let(:deck) { Fabricate(:deck, user: user) }
  background { sign_in(user) }

  scenario "Create button on new record" do
    visit new_deck_path
    expect(page).to have_selector(:link_or_button, "Create Deck")
  end

  scenario "Edit button on existing record" do
    visit edit_deck_path(deck.id)
    expect(page).to have_selector(:link_or_button, "Edit Deck")
  end
end

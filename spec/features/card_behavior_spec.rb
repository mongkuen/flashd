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


feature "show card" do
  let(:user) { Fabricate(:user) }

  scenario "shows edit/delete if card belongs to current_user" do
    deck = Fabricate(:deck, user: user)
    card = Fabricate(:card, deck: deck, user: user)
    sign_in(user)
    visit deck_card_path(deck, card)
    expect(page).to have_xpath("//a[@href='/decks/#{deck.id}/cards/#{card.id}/edit']")
    expect(page).to have_xpath("//a[@href='/decks/#{deck.id}/cards/#{card.id}']")
  end

  scenario "hides edit/delete if card does not belong to current_user" do
    user_2 = Fabricate(:user)
    deck = Fabricate(:deck, user: user_2)
    card = Fabricate(:card, deck: deck, user: user_2)
    sign_in(user)
    visit deck_card_path(deck, card)
    expect(page).not_to have_xpath("//a[@href='/decks/#{deck.id}/cards/#{card.id}/edit']")
    expect(page).not_to have_xpath("//a[@href='/decks/#{deck.id}/cards/#{card.id}']")
  end
end

feature "create/edit card form behavior" do
  let(:user) { Fabricate(:user) }
  let(:deck) { Fabricate(:deck, user: user) }
  let(:card) { Fabricate(:card, deck: deck, user: user) }
  background { sign_in(user) }

  scenario "Create button on new record" do
    visit new_deck_card_path(deck.id)
    expect(page).to have_selector(:link_or_button, "Create Card")
  end

  scenario "Edit button on existing record" do
    visit edit_deck_card_path(deck.id, card.id)
    expect(page).to have_selector(:link_or_button, "Edit Card")
  end
end

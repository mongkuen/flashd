# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

deck_2 = Deck.create(name: "Puppies Should Be First", img_url: "http://www.germanshepherdfacts.com/images/puppies3.jpg")
deck_1 = Deck.create(name: "German Shephards", img_url: "http://www.rescueagermanshepherd.org/wp-content/uploads/2012/07/german-shepherd-dog55.jpg", created_at: 5.day.ago)
deck_3 = Deck.create(name: "Black Shephards", img_url: "http://www.hdwallpapersnew.net/wp-content/uploads/2014/09/black-german-shepherd-puppy-new-desktop-wallpapers-free-download-dog-pictures.jpg", created_at: 5.day.ago)
deck_4 = Deck.create(name: "Dat Head Tilt", img_url: "http://thumbs.dreamstime.com/z/german-shepherd-12270656.jpg", created_at: 5.day.ago)
deck_5 = Deck.create(name: "Dat Ear Flop", img_url: "http://pad1.whstatic.com/images/thumb/d/de/Choose-a-German-Shepherd-Puppy-Step-1.jpg/670px-Choose-a-German-Shepherd-Puppy-Step-1.jpg", created_at: 5.day.ago)
deck_6 = Deck.create(name: "Vintage Should Be Last", img_url: "http://cutedogwallpapers.com/wp-content/uploads/2014/08/photos%20german%20shepherd-CWlc.jpg", created_at: 10.day.ago)

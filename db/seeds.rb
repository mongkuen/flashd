# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "test@test.com", password: "password")
adam = User.create(email: "adam@test.com", password: "password")

deck_2 = Deck.create(name: "Puppies Should Be First", img_url: "http://www.germanshepherdfacts.com/images/puppies3.jpg", user: user)
deck_1 = Deck.create(name: "German Shephards", img_url: "http://www.rescueagermanshepherd.org/wp-content/uploads/2012/07/german-shepherd-dog55.jpg", created_at: 5.day.ago, user: user)
deck_3 = Deck.create(name: "Black Shephards", img_url: "http://www.hdwallpapersnew.net/wp-content/uploads/2014/09/black-german-shepherd-puppy-new-desktop-wallpapers-free-download-dog-pictures.jpg", created_at: 5.day.ago, user: user)
deck_4 = Deck.create(name: "Dat Head Tilt", img_url: "http://thumbs.dreamstime.com/z/german-shepherd-12270656.jpg", created_at: 5.day.ago, user: user)
deck_5 = Deck.create(name: "Not My Deck", img_url: "http://pad1.whstatic.com/images/thumb/d/de/Choose-a-German-Shepherd-Puppy-Step-1.jpg/670px-Choose-a-German-Shepherd-Puppy-Step-1.jpg", created_at: 5.day.ago, user: adam)
deck_6 = Deck.create(name: "Vintage Should Be Last (Also not mine)", img_url: "http://cutedogwallpapers.com/wp-content/uploads/2014/08/photos%20german%20shepherd-CWlc.jpg", created_at: 10.day.ago, user: adam)

puppies_card_1 = Card.create(title: "Corgi", heading: "Two of these", description: "Adorable!", img_url: "http://xrdj144og6l4bdn0u3zy34o9.wpengine.netdna-cdn.com/wp-content/uploads/2015/04/Gorgeous_puppies.jpg", user: user, deck: deck_2)
puppies_card_1 = Card.create(title: "Bealge", heading: "Just One", description: "Cute!", img_url: "http://www.youwall.com/papel/cute_puppy_wallpaper_72013.jpg", user: user, deck: deck_2)

not_my_card_1 = Card.create(title: "Terrier", heading: "Vintage", description: "Cameraman dog!", img_url: "http://images.fineartamerica.com/images-medium-large-5/vintage-pho-dog-grapher-westie-edward-fielding.jpg", user: adam, deck: deck_6)
not_my_card_2 = Card.create(title: "People?", heading: "Wait a minute", description: "These dogs think they're people", img_url: "http://static.tumblr.com/emnuxgj/Jilli9ouu/1913-_pittie_frederick-schnell-father-in-law-ardolph-kline-shorpy.jpg", user: adam, deck: deck_6)

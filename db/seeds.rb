# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

Area.destroy_all
User.destroy_all
ListingCategory.destroy_all
Listing.destroy_all
Comment.destroy_all

a1 = Area.create(name: "Montlake", zip_code: 98112)
a2 = Area.create(name: "Downtown", zip_code: 98112)
a3 = Area.create(name: "Central District", zip_code: 98144)
a4 = Area.create(name: "Bainbridge", zip_code: 98168)
a5 = Area.create(name: "Bellingham", zip_code: 98122)

u1 = User.create(name: "Davis", bio: "I like to sell things.", area_id: a1.id)
u2 = User.create(name: "Jackson", bio: "I like to comment things.", area_id: a1.id)
u3 = User.create(name: "Billy", bio: "Taxi Manager", area_id: a2.id)

lc1 = ListingCategory.create(name: "Jobs", area_id: a1.id)
lc2 = ListingCategory.create(name: "Construction", area_id: a1.id)
lc3 = ListingCategory.create(name: "Outdoors", area_id: a1.id)
lc4 = ListingCategory.create(name: "Computers", area_id: a2.id)
lc5 = ListingCategory.create(name: "Food Service", area_id: a2.id)
lc6 = ListingCategory.create(name: "Taxi Driver", area_id: a2.id)

l1 = Listing.create(title: "Cool Guy Shirt", description: "Cool Guy Stuff", price: "17.99", listing_category_id: lc1.id, user_id: u1.id)
l2 = Listing.create(title: "Drywall Repair", description: "Good Job for a hardworker", price: "10 an hour", listing_category_id: lc2.id, user_id: u1.id)
l3 = Listing.create(title: "Hiking Guide", description: "I want someone to hike with me. ", price: "Friendship", listing_category_id: lc3.id, user_id: u1.id)
l4 = Listing.create(title: "Programmer", description: "Need someone to rewrite our code", price: "Min wage", listing_category_id: lc1.id, user_id: u1.id)
l5 = Listing.create(title: "Nighttime Taxi Driver", description: "Is needed. Bring knife much crime.", price: "30 an hour+ bandit loot", listing_category_id: lc6.id, user_id: u3.id)

c1 = Comment.create(content: "These shirts are so cool!", user_id: u1.id, listing_id: l1.id)
c2 = Comment.create(content: "These jobs are great!", user_id: u2.id, listing_id: l2.id)
c3 = Comment.create(content: "They're takin' our jobs!", user_id: u3.id, listing_id: l3.id)
c4 = Comment.create(content: "These things are awesome!", user_id: u1.id, listing_id: l4.id)
c5 = Comment.create(content: "Who knew I could be a cool guy!", user_id: u2.id, listing_id: l1.id)
c6 = Comment.create(content: "The things I could tell you!", user_id: u3.id, listing_id: l2.id)
c7 = Comment.create(content: "These pants are spiffy!", user_id: u1.id, listing_id: l3.id)
c8 = Comment.create(content: "This employer was super nice!", user_id: u2.id, listing_id: l4.id)
c9 = Comment.create(content: "This empolyer was a jerk!", user_id: u3.id, listing_id: l1.id)
c10 = Comment.create(content: "These pants are stretchy!", user_id: u1.id, listing_id: l2.id)
c11 = Comment.create(content: "This employer was extremely tough!", user_id: u2.id, listing_id: l3.id)
c12 = Comment.create(content: "This employer was strict!", user_id: u3.id, listing_id: l4.id)
c13 = Comment.create(content: "These pants are awful!", user_id: u1.id, listing_id: l1.id)
c14 = Comment.create(content: "These products are amazing!", user_id: u2.id, listing_id: l2.id)
c15 = Comment.create(content: "I love being a consumer!", user_id: u3.id, listing_id: l3.id)
c16 = Comment.create(content: "I love being a drone for the system!", user_id: u1.id, listing_id: l4.id)
c17 = Comment.create(content: "These pants are falling apart at the seams!", user_id: u1.id, listing_id: l1.id)
c18 = Comment.create(content: "These products are spectacular!", user_id: u2.id, listing_id: l2.id)
c19 = Comment.create(content: "I love buying!", user_id: u3.id, listing_id: l3.id)
c20 = Comment.create(content: "I need to save up to buy more!!!", user_id: u1.id, listing_id: l4.id)

#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# create_table "areas", force: :cascade do |t|

#     t.string "name"
#     t.integer "zip_code"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   create_table "comments", force: :cascade do |t|
#     t.text "content"
#     t.integer "user_id", null: false
#     t.integer "listing_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["listing_id"], name: "index_comments_on_listing_id"
#     t.index ["user_id"], name: "index_comments_on_user_id"
#   end

#   create_table "listing_categories", force: :cascade do |t|
#     t.string "name"
#     t.integer "area_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["area_id"], name: "index_listing_categories_on_area_id"
#   end

#   create_table "listings", force: :cascade do |t|
#     t.string "title"
#     t.text "description"
#     t.string "price"
#     t.integer "user_id", null: false
#     t.integer "category_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["category_id"], name: "index_listings_on_category_id"
#     t.index ["user_id"], name: "index_listings_on_user_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.text "bio"
#     t.integer "area_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["area_id"], name: "index_users_on_area_id"
#   end
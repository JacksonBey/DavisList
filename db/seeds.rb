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

u1 = User.create(name: "Davis", bio: "I like to sell things.", area_id: a1.id)

u2 = User.create(name: "Jackson", bio: "I like to comment things.", area_id: a1.id)

lc1 = ListingCategory.create(name: "Jobs", area_id: a1.id)

l1 = Listing.create(title: "Cool Guy Shirt", description: "Cool Guy Stuff", price: "17.99", listing_category_id: lc1.id, user_id: u1.id)

c1 = Comment.create(content: "These shirts are so cool!", user_id: u1.id, listing_id: l1.id)
c2 = Comment.create(content: "These shirts are so awesome!", user_id: u2.id, listing_id: l1.id)

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
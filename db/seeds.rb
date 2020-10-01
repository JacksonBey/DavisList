# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'

Area.destroy_all
User.destroy_all
ListingCategory.destroy_all
Listing.destroy_all
Comment.destroy_all

a1 = Area.create(name: "Montlake", zip_code: 98112)
a2 = Area.create(name: "Capitol Hill", zip_code: 98121)
a3 = Area.create(name: "Central District", zip_code: 98144)


u1 = User.create(name: "Davis", bio: "I like to jump on trampolines while selling things. Bidding wars are the best!", password: "123", area_id: a1.id)
u2 = User.create(name: "Jackson", bio: "I like to comment on listings. Excessively... I can't seem to stop myself.",  password: "123",area_id: a2.id)
u3 = User.create(name: "Billy", bio: "People have told me in the past to slow down. But I can't slow down.",  password: "123",area_id: a3.id)

Area.all.each do |area|
    3.times do
        ListingCategory.create({
            name: Faker::Job.field,
            area_id: area.id
        })
    end
end

ListingCategory.all.each do |listing_category|
    5.times do
        Listing.create({
            title: Faker::Hipster.sentence(word_count:3),
            description: Faker::Hipster.paragraphs(number:2),
            price: (10..100).to_a.sample.to_s,
            user_id: User.all.sample.id,
            listing_category_id: listing_category.id
        })
    end
end

Listing.all.each do |listing|
    10.times do
        Comment.create({
            content: Faker::Hipster.sentence(word_count:7),
            user_id: User.all.sample.id,
            listing_id: listing.id
        })
    end
end

Listing.all.each do |listing|
    4.times do
        Comment.create({
            content: Faker::Hipster.sentence(word_count:4),
            user_id: u2.id,
            listing_id: listing.id
        })
    end
end


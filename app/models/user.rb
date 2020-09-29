class User < ApplicationRecord
  belongs_to :area
  has_many :listings
  has_many :comments

  def all_comments
    self.comments.all.each do |comment|
      puts "#{comment.content}"
    end
  end

  def all_listings
    self.listings.all.each do |listing|
      puts "#{listing.title}:"
      puts "#{listing.description}"
      puts "#{listing.price}"
    end
  end

  def all_categories
    self.listings.all.each do |listing|
    end
  end

end

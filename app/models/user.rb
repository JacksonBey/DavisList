class User < ApplicationRecord
  belongs_to :area
  has_many :listings
  has_many :comments

  validates :name, presence: true
  validates :bio, length: { in: 30..500 }

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

end

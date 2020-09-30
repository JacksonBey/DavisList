class User < ApplicationRecord
  belongs_to :area
  has_many :listings
  has_many :comments

  validates :name, presence: true
  validates_uniqueness_of :name
  validates :bio, length: { in: 10..500 }
  has_secure_password

  def all_comments
    self.comments.all.each do |comment|
      puts "#{comment.content}"
    end
  end

  def all_listings
    self.listings.all
  end

end

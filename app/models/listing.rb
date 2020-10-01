class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :listing_category
  has_many :comments
  has_many :users, through: :comments

  validates :title, :price, presence: true
  validates :description, length: { in: 10..400 }
  validates :price, length: { in: 1..255}

  def area_name
      self.listing_category.area.name
  end

  def listing_area
    self.listing_category.area
  end

  def cat_name
    self.listing_category.name
  end 
  
  def listing_post_date
    #"#{self.created_at.strftime('%b')} #{self.created_at.day} #{self.created_at.time}"
    "#{self.created_at.strftime("%B %d, %Y at %l:%M")}"
  end

  def order_comments
    self.comments.all.order.created_at
  end

  def user_comments
    self.order_comments.each do |comment|
      puts comment.content
    end
  end


end

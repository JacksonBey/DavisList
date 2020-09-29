class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :content, length: { in: 2..100 }

  def listing_path
    self.listing.id
  end

end

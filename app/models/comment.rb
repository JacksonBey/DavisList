class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :content, length: { in: 2..200 }

  def listing_path
    self.listing.id
  end

  def comment_post_date
    "#{self.created_at.strftime("%B %d, %Y at %l:%M")}"
  end

end

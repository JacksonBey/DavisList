class User < ApplicationRecord
  belongs_to :area
  has_many :listings
  has_many :comments

  
end

class Image < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :image_users
end

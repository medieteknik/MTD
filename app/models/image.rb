class Image < ActiveRecord::Base
  # relations
  belongs_to :user
  has_and_belongs_to_many :photo_albums
end

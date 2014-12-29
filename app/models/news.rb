class News < ActiveRecord::Base
  translates :title, :content
  has_and_belongs_to_many :users
end

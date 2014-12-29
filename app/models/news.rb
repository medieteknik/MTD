class News < ActiveRecord::Base
  translates :title, :content, :versioning => :paper_trail
  globalize_accessors
  has_and_belongs_to_many :users
end

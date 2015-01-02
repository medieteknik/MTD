class News < ActiveRecord::Base
  translates :title, :content, :fallbacks_for_empty_translations => true, :versioning => :paper_trail
  globalize_accessors
  has_and_belongs_to_many :users
end

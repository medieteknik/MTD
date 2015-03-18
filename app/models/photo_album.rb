class PhotoAlbum < ActiveRecord::Base
  # relations
  has_and_belongs_to_many :images
  # translations
  translates :title, :fallbacks_for_empty_translations => true
  globalize_accessors
end

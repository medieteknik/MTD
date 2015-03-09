class Lecture < ActiveRecord::Base
  belongs_to :image

  # translations
  translates :description, :title, :fallbacks_for_empty_translations => true
  globalize_accessors

end

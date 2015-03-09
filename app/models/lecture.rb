class Lecture < ActiveRecord::Base
  belongs_to :image

  # translations
  translates :description, :title, :fallbacks_for_empty_translations => true
  globalize_accessors

  # validations
  validates :slug, :name, :start, :stop, presence: true
  validates :slug, uniqueness: true, allow_nil: true
end

class Company < ActiveRecord::Base
  # relations
  belongs_to :image
  has_and_belongs_to_many :users
  has_many :links

  accepts_nested_attributes_for :links

  # translations
  translates :description, :looking_for, :fallbacks_for_empty_translations => true, :versioning => :paper_trail
  globalize_accessors

  # validations
  validates :slug, :name, presence: true
  validates :slug, :first_day_spot, :second_day_spot, uniqueness: true, allow_nil: true
end

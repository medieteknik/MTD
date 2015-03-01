class Company < ActiveRecord::Base
  belongs_to :image
  has_and_belongs_to_many :users
  translates :description, :looking_for
end

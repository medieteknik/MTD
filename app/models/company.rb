class Company < ActiveRecord::Base
  belongs_to :image
  translates :description, :looking_for
end

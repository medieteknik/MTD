class Studentexpo < ActiveRecord::Base
  validates :title, :description, :course, :members, :name, :liuid, presence: true
  validates :liuid, format: { with: /([A-Za-z]{4,5}[0-9]{3})/ }
end

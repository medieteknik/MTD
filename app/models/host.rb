class Host < ActiveRecord::Base
  validates :name, :liuid, :phone, :year, :reason, :size, :member, :banquet, :first, :second, :third, presence: true
  validates :liuid, uniqueness: true, format: { with: /([A-Za-z]{4,5}[0-9]{3})/ }
end

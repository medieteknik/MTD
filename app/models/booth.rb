class Booth < ActiveRecord::Base
  validates :number, uniqueness: true, allow_nil: false

  def self.is_first_day_taken?
    Company.where(first_day_booth: self.id).any?
  end
  def self.is_second_day_taken?
    Company.where(second_day_booth: self.id).any?
  end
end

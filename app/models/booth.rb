class Booth < ActiveRecord::Base
  validates :number, uniqueness: true, allow_nil: false

  def is_first_day_taken
    Company.where(first_day_booth: id).any?
  end
  def is_second_day_taken
    Company.where(second_day_booth: id).any?
  end

  def is_first_day_unavailable
    !first_day
  end
  def is_second_day_unavailable
    !second_day
  end
end

class Studentexpo < ActiveRecord::Base
  before_save :set_course_title

  validates :title, :description, :members, :name, :liuid, presence: true
  validates :liuid, format: { with: /([A-Za-z]{4,5}[0-9]{3})/ }

	def set_course_title
		self.course = "N/A" if self.course.blank?
	end
end

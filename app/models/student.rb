class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates_presence_of :name

  def course_grade(course_id)
    self.student_courses.find_by(course_id: course_id).grade
  end

end

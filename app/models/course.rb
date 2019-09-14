class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses

  validates_presence_of :name

  def student_order
    students.joins(:student_courses)
            .select("students.name, student_courses.grade")
            .order("student_courses.grade DESC")
  end

end

class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    student = Student.find(params[:id])
    course = Course.find(params[:course_id])
    studentcourse = StudentCourse.find_by(student: student, course: course)
    studentcourse.delete
    redirect_to student_path(student)
  end

end

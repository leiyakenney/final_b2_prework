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

  def create
    course = Course.find(params[:course_id])
    student = Student.create(student_params)
    student.save
    @student_course = StudentCourse.create!(student: student, course: course, grade: 0)
    redirect_to student_path(student)
  end

  private
  def student_params
    params.permit(:name)
  end

end

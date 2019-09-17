# As a user,
# When I visit a course show page,
# Then I see:
# - the course's name
# - each student in the course listed in order from highest grade to lowest grade
require 'rails_helper'

RSpec.describe 'Course Show Page' do
  describe 'When I visit a course show page' do
    before :each do
      @leiya = Student.create(name: "Leiya Kenney")
      @caro = Student.create(name: "Caroline Song")
      @rox = Student.create(name: "Roxane Clement")
      @mrkt = Course.create(name: "Marketing")
      @sc_mrkt_lk = StudentCourse.create(student: @leiya, course: @mrkt, grade: 0.86)
      @sc_mrkt_cs = StudentCourse.create(student: @caro, course: @mrkt, grade: 0.882)
      @sc_mrkt_rc = StudentCourse.create(student: @rox, course: @mrkt, grade: 0.947)
    end

    it "I see the course's name and each student in the course listed from highest to lowest grade" do

      visit course_path(@mrkt)

      expected =(
        "#{@rox.name}: #{@sc_mrkt_rc.grade.round(2)}\n"
        "#{@caro.name}: #{@sc_mrkt_cs.grade.round(2)}\n"
        "#{@leiya.name}: #{@sc_mrkt_lk.grade.round(2)}"
      )

      expect(page).to have_content(@mrkt.name)
      expect(page).to have_content(expected)
    end
  end
end

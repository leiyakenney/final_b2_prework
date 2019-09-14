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
      @sc_mrkt_lk = StudentCourse.create(student: @leiya, course: @mrkt, grade: 86.0)
      @sc_mrkt_cs = StudentCourse.create(student: @caro, course: @mrkt, grade: 88.2)
      @sc_mrkt_rc = StudentCourse.create(student: @rox, course: @mrkt, grade: 94.7)
    end

    it "I see the course's name and each student in the course listed from highest to lowest grade" do

      visit course_show_path(@mrkt)

      expected =(
        "#{@rox.name}: #{@sc_mrkt_rc.grade}\n"
        "#{@caro.name}: #{@sc_mrkt_cs.grade}\n"
        "#{@leiya.name}: #{@sc_mrkt_lk.grade}"
      )

      expect(page).to have_content(@mrkt.name)
      expect(page).to have_content(expected)
    end
  end
end

# User Story 1, Student Show Page
# As a user,
# When I visit a student show page
# Then I see
# - the student's name
# - the name of each course the student is enrolled in
# - the student's grade for each course

require 'rails_helper'

RSpec.describe 'Student Show Page' do
  describe 'When I visit a student show page' do
    before :each do
      @leiya = Student.create(name: "Leiya Kenney")
      @listen = Course.create(name: "Art of Listening")
      @mrkt = Course.create(name: "Marketing")
      @sc_listen = StudentCourse.create(student: @leiya, course: @listen, grade: 98.0)
      @sc_mrkt = StudentCourse.create(student: @leiya, course: @mrkt, grade: 86.0)
    end

    it "I see student's name, course names, and grade for each course" do
      visit student_show_path(@leiya)

      expect(page).to have_content("#{@leiya.name}")

      within "#course-#{@listen.id}" do
        expect(page).to have_content("#{@listen.name}: #{@sc_listen.grade.round(2)}")
      end

      within "#course-#{@mrkt.id}" do
        expect(page).to have_content("#{@mrkt.name}: #{@sc_mrkt.grade.round(2)}")
      end
    end
  end
end

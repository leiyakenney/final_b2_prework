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
      @g = Student.create(name: "Gasper Gasperlin")
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

    it "I see a button 'Unenroll' next to each student's name" do
      visit course_path(@mrkt)

      within "#student-#{@rox.id}" do
        expect(page).to have_button('Unenroll')
      end

      within "#student-#{@caro.id}" do
        expect(page).to have_button('Unenroll')
      end

      within "#student-#{@leiya.id}" do
        expect(page).to have_button('Unenroll')
      end
    end

    it "When I click 'Unenroll,' I am redirected to that student's show page where I do not see the course listed" do
      visit course_path(@mrkt)

      within "#student-#{@leiya.id}" do
        click_button('Unenroll')
      end

      expect(current_path).to eq(student_path(@leiya))
      expect(page).not_to have_content(@mrkt.name)
    end

    it "I see a form to enroll a new student in this course that has a single input field for the student name" do
      visit course_path(@mrkt)

      expect(page).to have_content("Enroll A Student")
      expect(page).to have_button("Enroll")
    end

    it "When I type in the name of the student and click 'Enroll' then a new student is created and I am redirected to that student's show page where I see the course listed" do
      visit course_path(@mrkt)

      fill_in :name, with: @g.name
      click_button "Submit"

      expect(current_path).to eq(student_path(@g))
      expect(page).to have_content(@mrkt.name)
    end
  end
end

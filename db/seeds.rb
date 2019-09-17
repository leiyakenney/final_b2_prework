# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
leiya = Student.create(name: "Leiya Kenney")
caro = Student.create(name: "Caroline Song")
rox = Student.create(name: "Roxane Clement")
mrkt = Course.create(name: "Marketing")
calc = Course.create(name: "Calculus")
listen = Course.create(name: "Art of Listening")
sc_mrkt_lk = StudentCourse.create(student: leiya, course: mrkt, grade: 0.86)
sc_mrkt_cs = StudentCourse.create(student: caro, course: mrkt, grade: 0.882)
sc_mrkt_rc = StudentCourse.create(student: rox, course: mrkt, grade: 0.947)

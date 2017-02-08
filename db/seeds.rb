# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Submission.destroy_all

sub_1 = Submission.create(title: "first", author: "Sam", body: "This is the first post in the line")
sub_2 = Submission.create(title: "second", author: "Steph", body: "This is the second post in the line")
sub_3 = Submission.create(title: "third", author: "Steve", body: "This is the third post in the line")

puts "seeding complete"

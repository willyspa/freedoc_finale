# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Doctor.reset_pk_sequence
Patient.reset_pk_sequence
Appointment.reset_pk_sequence

10.times do
  doctor = Doctor.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,specialty: Faker::Job.position,zip_code: Faker::Address.zip_code)
  p "Dr. #{doctor.last_name}"
  doctor.save
end

20.times do
  patient = Patient.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  p "Patients: #{patient.first_name} #{patient.last_name}"
  patient.save

end

25.times do
  appointment = Appointment.new(date: Faker::Date.forward(30))
  appointment.doctor = Doctor.all.sample
  appointment.patient = Patient.all.sample
  p "rendez vous de #{appointment.patient.first_name} avec le Dr. #{appointment.doctor.last_name} le #{appointment.date}"
end







=begin
10.times do
  article = Article.create!(user_id: rand(1..10), category_id: rand(1..5), title: Faker::Job.key_skill, content: Faker::ChuckNorris.fact)
  p "article #{article.title} : #{article.content}"
end

15.times do
  comment = Comment.create(user_id: rand(1..10), article_id: rand(1..10), content: Faker::TvShows::Simpsons.quote)
  p "comment #{comment.content}"
end

15.times do
  like = Like.create(user_id: rand(1..10), article_id: rand(1..10))
end
=end

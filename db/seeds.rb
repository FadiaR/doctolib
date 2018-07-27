# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
10.times do
  City.create(city_name: Faker::Name.first_name)
end

10.times do
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end


10.times do
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, postal_code: Faker::Address.postcode, city_id: City.all.sample.id )
end

# create 15 appointments, each of them with a doctor and a patient
10.times do
  Appointment.create(date: Faker::Time.forward(60, :day), patient_id: Patient.all.sample.id, doctor_id: Doctor.all.sample.id, city_id: City.all.sample.id)
end

10.times do
  Speciality.create(name: Faker::Science.element)
end

Doctor.all.each do |doctor|
  doctor.speciality.push(Speciality.all.sample)
  doctor.save
end

Speciality.all.each do |speciality|
  speciality.doctors.push(Doctor.all.sample)
  speciality.save
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 ##Generate 5 Patients
# 20.times do
#     Patient.create({
#         name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         payment_uptodate: Faker::Boolean.boolean,
#         phone_number: Faker::PhoneNumber.cell_phone,
#         email: Faker::Internet.free_email,
#         address: Faker:: Address.street_address
#     })
# end

##Generate 5 Doctors
# 5.times do
#     Doctor.create({
#         name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         phone_number: Faker::PhoneNumber.cell_phone,
#         email: Faker::Internet.free_email,
#         address: Faker:: Address.street_address
#     })
# end

##Generate 10
Doctor.all.each do |doctor|
    start_at = DateTime.parse('Sun, 24 May 2020 08:00:00 -0300')
    d_id = doctor.id
    start_at = start_at + d_id.day
    end_at = start_at + 30.minutes

    (1..8).each do |index|
        puts "starting loop"
        doctor_speciality_id = DoctorSpeciality.where(doctor_id: d_id)[0].speciality_id
        puts "after dsi"
        puts d_id
        doctor_speciality_name = Speciality.where(id: doctor_speciality_id)[0].name
        puts "after dsn"
        doctor.appointments.create(start_time: start_at, end_time: end_at, doctor_name: doctor.name + ' ' + doctor.last_name, speciality_name: doctor_speciality_name)
        puts "after dac"

        start_at = end_at
        end_at = start_at + 30.minutes
    end
end


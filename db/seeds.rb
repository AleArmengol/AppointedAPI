# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    # Generate 5 Patients
5.times do
    Patient.create({
        name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        payment_uptodate: Faker::Boolean.boolean,
        phone_number: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.free_email,
        address: Faker:: Address.street_address
    })
end

    #Generate 5 Patients
5.times do
    Doctor.create({
        name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.free_email,
        address: Faker:: Address.street_address
    })
end


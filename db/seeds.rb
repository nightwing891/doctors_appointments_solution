specialities = ['strange', 'pediatrics', 'family medicine']
dates = ['4-12-19', '5-12-19', '3-2-19', '7-11-19', '8-23-19']
dobs = ['4-12-91', '5-12-29', '3-2-79', '7-11-69', '8-23-59']

10.times do
  dr = Doctor.create(
    first_name: Faker::Superhero.prefix,
    last_name: Faker::ProgrammingLanguage.name
  )
 
  10.times do 
    user = User.create(
      first_name: Faker::Food.dish,
      last_name: Faker::Hipster.word,
      dob: dobs.sample
    )

    Appointment.create(
      speciality: specialities.sample,
      doctor_id: dr.id,
      user_id: user.id,
      time: dates.sample
    )
  end
end

puts "Data Seeded."
# Seeds

10.times do
  Student.create(
    reg_no: Faker::IDNumber.valid,
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    school: Faker::Job.field,
    password: 'shahada',
    activated: true
  )
  puts '.....'
end


10.times do
  Lecturer.create(
    id_no: Faker::IDNumber.valid,
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    school: Faker::Job.field,
    password: 'shahada',
    activated: true
  )
  print '/././'
end

Lecturer.all.each do |lec|
  5.times do
    Assignment.create(
      unit_code: rand.to_s[2..4],
      title: Faker::Lorem.sentence,
      assignment: Faker::Lorem.paragraph,
      lecturer_id: lec.id,
      due_date: Faker::Date.between(Date.today, 1.year.from_now)
    )
    print '.....'
  end
end


Lecturer.all.each do |lec|
  5.times do
    Question.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      category: Faker::Job.field,
      tag: Faker::Lorem.word,
      user_id: lec.id,
      user_type: 'Lecturer'
    )
  end
  puts '*****'
end

Student.all.each do |student|
  5.times do
    Question.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      category: Faker::Job.field,
      tag: Faker::Lorem.word,
      user_id: student.id,
      user_type: 'Student'
    )
  end
  puts '----'
end


5.times do
  Answer.create(
    body: Faker::Lorem.paragraph,
    question_id: Question.all.sample.id,
    user_id: Lecturer.all.sample.id,
    user_type: 'Lecturer'
  )
  puts '$$$$$'
end

5.times do
  Answer.create(
    body: Faker::Lorem.paragraph,
    question_id: Question.all.sample.id,
    user_id: Student.all.sample.id,
    user_type: 'Student'
  )
  puts '@@@@@'
end

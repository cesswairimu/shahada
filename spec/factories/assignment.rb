FactoryBot.define do
  factory :assignment do

    association :lecturer
    unit_code 'scs123'
    title 'Girl'
    due_date 10.days.from_now


  end
end

FactoryBot.define do

  factory :student do
    reg_no "SC/00030/2013"
    f_name "Felix"
    l_name "Simon"
    phone "0720675434"
    school "Medicine"
    password "wairimu"
    password_confirmation "wairimu"
    sequence (:email) { |n|  "felsi#{n}@gmail.com" }
    activated true
    activated_at Time.zone.now
  end

  factory :student1, class: Student  do
    f_name nil
  end

end

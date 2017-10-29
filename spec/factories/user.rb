FactoryGirl.define do
  factory :user do
    reg_no "SC/00030/2013"
    f_name "Felix"
    l_name "Simon"
    phone "0720675434"
    school "Medicine"
    password "wairimu"
    password_confirmation "wairimu"
    sequence (:email) { |n|  "felsi#{n}@gmail.com" }
  end
  factory :user1, class: User  do
    f_name nil
  end
end

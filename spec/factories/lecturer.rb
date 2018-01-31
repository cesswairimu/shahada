FactoryGirl.define do

  factory :lecturer do
    id_no "SC/00030/2013"
    f_name "Cortana"
    l_name "Bot"
    phone "0720675034"
    school "Computing"
    password "wairimu"
    password_confirmation "wairimu"
    sequence (:email) { |n|  "felsi#{n}@gmail.com" }
    activated true
    activated_at Time.zone.now
  end

  factory :lecturer_invalid, class: Lecturer do
    id_no nil
  end

end

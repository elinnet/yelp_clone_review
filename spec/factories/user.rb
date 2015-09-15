FactoryGirl.define do

  sequence :email do |n|
    "example@mail.com#{n}"
  end

  factory :user do
    email { generate(:email) }
    password "12345678"
    password_confirmation "12345678"
  end
end

FactoryGirl.define do
  factory :email do
    sequence(:email, 100) { |n| "person#{n}@example.com" }
  end
end

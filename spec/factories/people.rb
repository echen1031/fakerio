# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    email "MyString"
    ip_address "MyString"
    name "MyString"
    credit_card "MyString"
    bio "MyText"
    phone "MyString"
    avatar "MyString"
  end
end

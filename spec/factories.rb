# Define User model object.
FactoryGirl.define do
  factory :user do
    name                  "Jane Doe"
    email                 "jane.doe@testing.com"
    password              "secret"
    password_confirmation "secret"
  end
end
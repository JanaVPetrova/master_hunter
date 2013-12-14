# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    nickname { generate :string }
    description { generate :string }
    place { generate :string }
    date { generate :date }
    association :user, factory: :user
  end
end

FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    name { generate :string }
    admin false
  end

  factory :admin, parent: :user do
    admin true
  end
end

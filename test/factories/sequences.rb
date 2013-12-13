FactoryGirl.define do
  sequence :string do |n|
    "string#{n}"
  end

  sequence :integer do |n|
    n
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :phone do |n|
    "+7#{n % 10}"
  end
end

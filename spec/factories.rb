FactoryGirl.define do
  sequence :email do |n|
    "email-#{n}@factory.com"
  end

  factory :user do
    email
    password  "juancar1os"
    password_confirmation { "juancar1os"}
  end

  factory :action do
    name      "accion1"
    desc      "descripcion"
    points    10
    level     30
  end

  factory :badge do
    name    "badge1"
    desc      "descripcion"
    points    100
  end
end

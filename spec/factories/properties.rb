FactoryBot.define do
  factory :property do
    name { "MyString" }
    user { nil }
    address { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    price { 1 }
    currency { "MyString" }
    surface_area { 1.5 }
    bed { 1 }
    bath { 1.5 }
    floor { 1 }
  end
end

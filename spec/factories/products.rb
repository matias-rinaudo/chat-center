FactoryBot.define do
  factory :payment, class: 'Product' do
    name { 'Exotic Meats Crate' }
    price { 99_99 }
    stock { 10 }
  end
end

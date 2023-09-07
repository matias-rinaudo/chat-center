FactoryBot.define do
  factory :user do
    email { 'rinaudom96@gmail.com' }
    password { 'sebastian10' }
    password_confirmation { 'sebastian10' }
    customer_support { true }
  end
end
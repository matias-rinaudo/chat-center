FactoryBot.define do
  factory :payment, class: 'Order' do
    customer_name { 'Matias' }
    adress { '60 GRANADEROS' }
    zip_code { '5515' }
    shipping_method { 'processing' }
    fedex_id { '1' }
  end
end

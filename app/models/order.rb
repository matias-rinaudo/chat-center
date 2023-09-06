class Order < ApplicationRecord
  STATUS = ['processing'].concat(Fedex::Shipment::STATUS).freeze
  
  belongs_to :product
end

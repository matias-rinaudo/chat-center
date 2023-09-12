class Order < ApplicationRecord
  include CreateShipment

  STATUS = ['processing'].concat(Fedex::Shipment::STATUS).freeze

  belongs_to :product

  validates :customer_name, :adress, :zip_code, :shipping_method, presence: true

  after_create :create_shipment
end

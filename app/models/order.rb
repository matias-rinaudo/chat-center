class Order < ApplicationRecord
  STATUS = ['processing'].concat(Fedex::Shipment::STATUS).freeze

  belongs_to :product

  validates :customer_name, :adress, :zip_code, :shipping_method, presence: true

  def full_adress
    "#{self.adress}, #{self.zip_code}"
  end
end

class Order < ApplicationRecord
  STATUS = ['processing'].concat(Fedex::Shipment::STATUS).freeze

  belongs_to :product

  validates :customer_name, :adress, :zip_code, :shipping_method, presence: true

  after_create :create_shipment

  def full_adress
    "#{self.adress}, #{self.zip_code}"
  end

  private

  def create_shipment
    shipment = Fedex::Shipment.new.create

    self.fedex_id = shipment.id if shipment.present?

    self.save
  end
end

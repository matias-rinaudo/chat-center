module CreateShipment
  extend ActiveSupport::Concern

  def create_shipment
    shipment = Fedex::Shipment.new.create

    self.fedex_id = shipment.id if shipment.present?

    self.save
  end
end
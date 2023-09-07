class UpdateShippingStatusJob < ActiveJob::Base
  queue_as :default

  def perform
    orders = Order.all
    fedex_ids = orders.map(&:fedex_id).compact

    orders.each do |order|
      if orde
        
      end
      shipment = Fedex::Shipment.find(order.fedex_id) 
    end
  end
end

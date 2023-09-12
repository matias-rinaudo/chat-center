class UpdateShippingStatusJob < ActiveJob::Base
  queue_as :default

  def perform
    orders = Order.all

    orders.map do |order|
      order.create_shipment unless order.fedex_id.present?

      shipment = Fedex::Shipment.find(order.fedex_id) 
      order.shipping_method = shipment.status

      OrderMailer.success_update_status_order(order_id: order.id).deliver_now

      puts "Estado de envio de la order ID: #{order.id} actualizado" if order.save
    end
  end
end

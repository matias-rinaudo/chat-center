namespace :update_shipping_status_job do
  desc "update status order"
  task :update_status_order => :environment do
    orders = Order.where.not(fedex_id: nil)

    orders.map do |order|
      shipment = Fedex::Shipment.find(order.fedex_id) 
      order.shipping_method = shipment.status

      OrderMailer.success_update_status_order(order_id: order.id).deliver_now

      order.save
    end
  end
end

namespace :update_shipping_status_job do
  desc "update status order"
  task :update_status_order => :environment do
    @order_ids = Order.all.map(&:id)

    Orders::UpdateShipmentStatusWorker.perform_async(@order_ids)
  end
end

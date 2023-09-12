class UpdateShippingStatusJob < ActiveJob::Base
  queue_as :default

  def perform
    @order_ids = Order.all.map(&:id)

    Orders::UpdateShipmentStatusWorker.perform_async(@order_ids)
    end
  end
end

module Orders
  class UpdateShipmentStatusWorker
    include Sidekiq::Job
    sidekiq_options queue: :default, retry: false

    def perform(order_ids)
      orders = Order.where(id: order_ids)

      Rails.logger.info("Missing orders") if orders.blank?      

      orders.map do |order|
        result = Orders::Shipment::Organizer.call(order_id: order.id)

        Rails.logger.info("#{result.status}") if result.success?

        Rails.logger.info("#{result.error}")
      end
    end
  end
end

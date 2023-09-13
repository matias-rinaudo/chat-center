module Orders
  module Shipment
    class UpdateStatus
      include CreateShipment
      include Interactor

      before do
        context.fail!(error: 'Missing order ID') if context.order_id.blank?

        context.order = find_order(context.order_id)
      end

      def call
        context.order.create_shipment unless context.order.fedex_id.present?

        context.shipment = Fedex::Shipment.find(context.order.fedex_id) 

        context.order.shipping_method = context.shipment.status

        context.order.save

        context.status = :ok
      rescue
        context.fail!(error: "Error updating the shipping status of the order ID: #{context.order.id}")
      end

      private

      def find_order(id)
        begin
          Order.find(id)
        rescue
          context.fail!(error: "Order not found with ID: #{context.order_id}") unless context.order.present?
        end
      end
    end
  end
end

module Orders
  module Shipment
    class SendEmail
      include Interactor

      def call
        OrderMailer.success_update_status_order(order_id: context.order.id).deliver_now 

        context.status = :ok
      end
    end
  end
end

class OrderMailer < ApplicationMailer
  def success_update_status_order(order_id)
    @order = Order.find(order_id)
    coo_email = ENV['COO_EMAIL']
    mail(to: coo_email, subject: 'Status shipment succes!'
  end
end

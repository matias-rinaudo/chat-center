require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { build :order }

  describe 'associations' do
    it { belong_to(:product) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:customer_name) }
    it { is_expected.to validate_presence_of(:adress) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:shipping_method) }
  end

  describe 'send_email_updated_status_shipment' do
    it 'send email' do
      expect { OrderMailer.success_update_status_order(order_id: order.id) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end

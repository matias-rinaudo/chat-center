require 'spec_helper'

RSpec.describe Orders::Shipment::UpdateStatus, type: :interactor do
  describe '.call' do
    subject { described_class.call(order_id: order_id) }

    let(:order_id) { 1 }

    describe 'update_status_and_send_email' do
      context 'get status 200' do
        it 'update order' do
          expect(subject.status).to eq(200)
        end
      end
    end

    describe 'validations' do
      context 'error update status shipment' do
        it 'fails the context update status shipment' do
          expect(subject).to be_a_failure
          expect(subject.error).to eq('Error updating the shipping status of the order ID: 1')
        end
      end

      context 'when missing order id' do
        let(:order_id) { nil }

        it 'fails the context missing order id' do
          expect(subject).to be_a_failure
          expect(subject.error).to eq('Missing order ID')
        end
      end

      context 'when order not found' do
        let(:order_id) { 7 }

        it 'fails the context order not found' do
          expect(subject).to be_a_failure
          expect(subject.error).to eq('Order not found with ID: 7')
        end
      end
    end
  end
end

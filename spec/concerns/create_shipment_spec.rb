require 'spec_helper'

RSpec.shared_examples CreateShipment do
  it '#create_shipment' do
    let(:order) { build :order }
    let(:shipment) { order.create_shipment }
    expect(shipment.id).to eq 1
  end
end

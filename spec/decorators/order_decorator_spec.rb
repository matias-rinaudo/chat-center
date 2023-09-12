require 'rails_helper'

RSpec.describe OrderDecorator do
  subject(:order) { build :order }

  it 'returns full adress' do
      expect(order.decorate.full_adress).to eq('60 GRANADEROS, 5515')
  end
end

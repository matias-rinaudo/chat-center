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
end

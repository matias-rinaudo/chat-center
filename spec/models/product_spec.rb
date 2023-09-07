require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { build :product }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:stock) }
  end
end

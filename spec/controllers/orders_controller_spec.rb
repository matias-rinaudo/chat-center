RSpec.describe ::OrdersController, type: :controller do
  describe "#search" do
    let!(:product1) {create(:product, name: 'Exotic Meats Crate', price: 99.99, stock: 10)}
    let!(:product2) {create(:product, name: 'Smash and Grab Gift Card', price: 74.99, stock: 10)}
    let!(:order1) { create(:order, product: product1, customer_name: 'Matias', adress: '60 GRANADEROS', zip_code: '5515', shipping_method: 'processing', created_at: DateTime.now - 1) }
    let!(:order2) { create(:order, product: product2, customer_name: 'Sebastian', adress: '60 GRANADEROS', zip_code: '5515', shipping_method: 'awaiting_pickup') }

    context 'find orders specific shipping_method' do
      before { get :index, q: {shipping_method_eq: 'processing'} }

      it "find order 1" do
        expect(assigns(:orders).first).to eq [order1]
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
    end

    context 'find orders by created_at' do
      before { get :index, q: {created_at_gteq: DateTime.now.beginning_of_day, created_at_lteq: DateTime.now.end_of_day} }

      it "find order 2" do
        expect(assigns(:orders).second).to eq [order2]
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
    end
  end
end
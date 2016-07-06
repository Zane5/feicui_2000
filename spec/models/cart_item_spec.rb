require 'rails_helper'

describe CartItem do
  it { should belong_to(:user) }
  it { should belong_to(:product) }

  describe "#product_name" do
    it "return the name of the associated product" do
      product = Fabricate(:product, name: 'bmw3')
      cart_item = Fabricate(:cart_item, product: product)
      expect(cart_item.product_name).to eq('bmw3')
    end
  end
end

require 'rails_helper'

describe CartItemsController do
  describe "GET index" do
    it "sets @cart_items to the queue items of the logged in user" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      cart_item1 = Fabricate(:cart_item, user: alice)
      cart_item2 = Fabricate(:cart_item, user: alice)
      get :index
      expect(assigns(:cart_items)).to match_array([cart_item1, cart_item2])
    end

    it_behaves_like "requires sign in" do
      let(:action) { get :index }
    end
  end

  describe "POST create" do
    it "redirect to the my cart page" do
      set_current_user
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(response).to redirect_to my_cart_path
    end

    it "create a cart item" do
      set_current_user
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(CartItem.count).to eq(1)
    end

    it "create the cart item that is associated with product" do
      set_current_user
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(CartItem.first.product).to eq(product)
    end

    it "create the cart item that is associated with sign in user" do
      alice = Fabricate(:user)
      set_current_user(alice)
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(CartItem.first.user).to eq(alice)
    end

    it "puts the video as the last one in the cart items" do
      alice = Fabricate(:user)
      set_current_user(alice)
      bmw3 = Fabricate(:product)
      Fabricate(:cart_item, product: bmw3, user:alice)
      vw = Fabricate(:product)
      post :create, product_id: vw.id
      vw_cart_item = CartItem.where(product_id: vw.id, user_id: alice.id).first
      expect(vw_cart_item.position).to eq(2)
    end

    it "does not add the product in the queue if the product is already in cart items" do
      alice = Fabricate(:user)
      set_current_user(alice)
      bmw3 = Fabricate(:product)
      Fabricate(:cart_item, product: bmw3, user:alice)
      vw = Fabricate(:product)
      post :create, product_id: bmw3.id
      expect(alice.cart_items.count).to eq(1)
    end

    it_behaves_like "requires sign in" do
      let(:action) { post :create, product_id: 3 }
    end
  end

  describe "DELETE destroy" do
    it "redirect to the my cart page" do
      set_current_user
      cart_item = Fabricate(:cart_item)
      delete :destroy, id: cart_item.id
      expect(response).to redirect_to my_cart_path
    end

    it "deletes the cart item" do
      alice = Fabricate(:user)
      set_current_user(alice)
      cart_item = Fabricate(:cart_item, user: alice)
      delete :destroy, id: cart_item.id
      expect(CartItem.count).to eq(0)
    end

    it "does not delete the cart item if the cart item is not in the current user's cart items" do
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      set_current_user(alice)
      cart_item = Fabricate(:cart_item, user: bob)
      delete :destroy, id: cart_item.id
      expect(CartItem.count).to eq(1)
    end

    it_behaves_like "requires sign in" do
      let(:action) { delete :destroy, id: 3 }
    end
  end

  describe "DELETE destroy" do
    it "redirect to the my cart page" do
      set_current_user
      cart_item = Fabricate(:cart_item)
      delete :destroy, id: cart_item.id
      expect(response).to redirect_to my_cart_path
    end

    it "deletes the cart item" do
      alice = Fabricate(:user)
      set_current_user(alice)
      cart_item = Fabricate(:cart_item, user: alice)
      delete :destroy, id: cart_item.id
      expect(CartItem.count).to eq(0)
    end

    it "does not delete the cart item if the cart item is not in the current user's cart items" do
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      set_current_user(alice)
      cart_item = Fabricate(:cart_item, user: bob)
      delete :destroy, id: cart_item.id
      expect(CartItem.count).to eq(1)
    end

    it_behaves_like "requires sign in" do
      let(:action) { delete :destroy, id: 3 }
    end
  end

  describe "POST buy immediately" do
    context "with valid inputs" do
      it "redirect to the cart item page"
    end
    context "with invalid inputs"
    context "with unauthenticated users"
    context "with cart items that do not belong to the current user"
  end

end

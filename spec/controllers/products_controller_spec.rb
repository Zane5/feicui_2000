require 'rails_helper'

describe ProductsController do
  describe "GET show" do
    context 'with unauthenticated users' do
      it "sets @product" do
        product = Fabricate(:product)
        get :show, id: product.id
        expect(assigns(:product)).to eq(product)
      end

      it "sets @reviews for anonymous" do
        product = Fabricate(:product)
        review1 = Fabricate(:review, product: product)
        review2 = Fabricate(:review, product: product)
        get :show, id: product.id
        expect(assigns(:reviews)).to match_array [review1, review2]
      end
    end

    context 'with authenticated users' do
      before do
        session[:user_id] = Fabricate(:user).id
      end
    end
  end

  describe "POST search" do
    it "sets @results" do
      bmw5 = Fabricate(:product, name: 'BMW  5')
      post :search, search_term: 'BM'
      expect(assigns(:results)).to eq([bmw5])
    end

  end
end

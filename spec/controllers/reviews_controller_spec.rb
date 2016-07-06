require 'rails_helper'

describe ReviewsController do
  describe "POST create" do
    context "with authenticated users" do

      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }

      context "with valid inputs" do
        it "redirect to the video show page" do
          product = Fabricate(:product)
          post :create, review: Fabricate.attributes_for(:review), product_id: product.id
          expect(response).to redirect_to product
        end

        it "create a review" do
          product = Fabricate(:product)
          post :create, review: Fabricate.attributes_for(:review), product_id: product.id
          expect(Review.count).to eq(1)
        end
        
        it "create a review associated with the product" do
          product = Fabricate(:product)
          post :create, review: Fabricate.attributes_for(:review), product_id: product.id
          expect(Review.first.product).to eq(product)
        end

        it "create a review associated with the signed in user" do
          product = Fabricate(:product)
          post :create, review: Fabricate.attributes_for(:review), product_id: product.id
          expect(Review.first.user).to eq(current_user)
        end
      end

      context "with invalid inputs" do
        it "does not create a review" do
          product = Fabricate(:product)
          post :create, review: { content: 'ok' }, product_id: product.id
          expect(Review.count).to eq(0)
        end

        it "renders the videos/show template" do
          product = Fabricate(:product)
          post :create, review: { content: 'ok' }, product_id: product.id
          expect(response).to render_template "products/list"
        end

        it "sets @product" do
          product = Fabricate(:product)
          post :create, review: { content: 'ok' }, product_id: product.id
          expect(assigns(:product)).to eq(product)
        end

        it "sets @reviews" do
          product = Fabricate(:product)
          review = Fabricate(:review, product: product)
          post :create, review: { content: 'ok' }, product_id: product.id
          expect(assigns(:reviews)).to match_array([review])
        end
      end
    end
  
    context "with unauthenticated users" do
      it "redirect to the sign in path" do
        product = Fabricate(:product)
        post :create, review: Fabricate.attributes_for(:review), product_id: product.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end

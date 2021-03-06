require 'rails_helper'

describe UsersController do
  describe "Get new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "with valid input" do
      before { post :create, user: Fabricate.attributes_for(:user) }

      it "create the user" do
        expect(User.count).to eq(1)
      end

      it "redirect to the sign in page" do
        expect(response).to redirect_to sign_in_path
      end
    end   

    context "with invalid input" do
      before { post :create, user: { password: "password", full_name: "Tim TT"} }

      it "does not create the user" do
        expect(User.count).to eq(0)
      end

      it "render the :new template" do
        expect(response).to render_template :new
      end

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end

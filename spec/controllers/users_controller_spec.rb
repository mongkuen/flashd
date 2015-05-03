require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets new @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders :new template" do
      get :new
      expect(response).to render_template :new
    end

    it_behaves_like "hidden from user" do
      let(:action) { get :new }
    end
  end

  describe "POST create" do
    context "valid input" do
      let(:user) { Fabricate.attributes_for(:user) }
      before { post :create, user: user }

      it "creates new user with parameters" do
        expect(assigns(:user).email).to eq(user[:email])
      end

      it "creates new user" do
        expect(User.count).to eq(1)
      end

      it "sets the created user in session" do
        expect(session[:user_id]).to eq(User.first.id)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to root_path
      end
    end

    context "invalid input" do
      let(:user) { Fabricate.attributes_for(:user, email: "") }
      before { post :create, user: user }

      it "does not create new user" do
        expect(User.count).to eq(0)
      end

      it "renders new template" do
        expect(response).to render_template :new
      end
    end

    it_behaves_like "hidden from user" do
      let(:action) { post :create }
    end
  end
end

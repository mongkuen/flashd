require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end

    it_behaves_like "hidden from user" do
      let(:action) { get :new }
    end
  end

  describe "POST create" do
    context "valid login" do
      let(:user) { Fabricate(:user) }
      before { post :create, email: user.email, password: user.password }

      it "sets user in session" do
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end
    end

    context "invalid login" do
      let(:user) { Fabricate(:user) }
      before { post :create, email: user.email, password: "" }

      it "does not set user in session" do
        expect(session[:user_id]).to be_nil
      end

      it "redirects to login path" do
        expect(response).to redirect_to login_path
      end

      it "sets flash message" do
        expect(flash[:error]).to be_present
      end
    end

    it_behaves_like "hidden from user" do
      let(:action) { post :create }
    end
  end

  describe "GET destroy" do
    let(:user) { Fabricate(:user) }
    before do
      session[:user_id] = user.id
      get :destroy
    end

    it "clears session" do
      expect(session[:user_id]).to be_nil
    end

    it "redirects to root" do
      expect(response).to redirect_to root_path
    end
  end
end

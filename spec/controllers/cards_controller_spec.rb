require 'rails_helper'

describe CardsController do
  describe "GET index" do
    it "should get index" do
      get :index
      expect(response).to render_template :index
    end
  end
end

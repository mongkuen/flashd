require 'rails_helper'

RSpec.describe ApplicationController do
  describe "#current_user" do
    let(:user) { Fabricate(:user) }

    it "returns user if session user id exists" do
      session[:user_id] = user.id
      expect(subject.current_user.id).to eq(user.id)
    end

    it "returns nothing if session empty" do
      session[:user_id] = nil
      expect(subject.current_user).to be_nil
    end
  end

  describe "#logged_in?" do
    let(:user) { Fabricate(:user) }

    it "should return true if logged in" do
      session[:user_id] = user.id
      expect(subject.logged_in?).to be_truthy
    end

    it "should return false if not logged in" do
      session[:user_id] = nil
      expect(subject.logged_in?).to be_falsey
    end
  end
end

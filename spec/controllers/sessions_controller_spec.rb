require 'spec_helper'

describe SessionsController do
  describe "create" do
    let(:auth_hash) do
      {
        :provider => 'facebook',
        :uid => '1234567',
        :info => {
          :email => 'joe@bloggs.com',
          :first_name => 'Joe',
          :last_name => 'Bloggs'
        }
      }
    end

    it "creates a new User" do
      request.env['omniauth.auth'] = auth_hash

      post :create

      User.where(:email => 'joe@bloggs.com').count.should == 1
    end

    it "does not create the same User" do
      User.create(:email => auth_hash[:info][:email])
      request.env['omniauth.auth'] = auth_hash

      post :create

      User.where(:email => 'joe@bloggs.com').count.should == 1
    end

    it "redirects to home" do
      request.env['omniauth.auth'] = auth_hash

      post :create

      response.should redirect_to(root_path)
    end

    it "stores user id in session" do
      request.env['omniauth.auth'] = auth_hash

      post :create

      user = User.last
      session[:user_id].should == user.id
    end
  end

  describe "destroy" do
    it "sets session user id to nil" do
      session[:user_id] = 1

      delete :destroy

      session[:user_id].should be_nil
    end

    it "redirects to home" do
      delete :destroy
      response.should redirect_to(root_path)
    end
  end
end
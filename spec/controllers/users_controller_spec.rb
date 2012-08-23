require 'spec_helper'

describe UsersController do
  describe "POST create" do
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

    it "does not creates the same User" do
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
  end
end
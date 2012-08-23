require 'spec_helper'

describe UsersHelper do
	describe "login?" do
		it "is true if user is in session" do
			session[:user_id] = 1
			login?.should be_true
		end

		it "is false if user is not in session" do
			session[:user_id] = nil
			login?.should be_false
		end
	end
end

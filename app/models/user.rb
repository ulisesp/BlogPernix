class User < ActiveRecord::Base
  attr_accessible :active, :email, :first_name, :last_name, :login_type
end

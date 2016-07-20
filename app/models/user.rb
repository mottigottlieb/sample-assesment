class User < ActiveRecord::Base
require 'pry'
	has_secure_password
	has_many :lawyers

end
  

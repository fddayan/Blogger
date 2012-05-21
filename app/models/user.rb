class User < ActiveRecord::Base
  attr_accessible :birthdate, :image, :lastname, :mail, :name, :password
end

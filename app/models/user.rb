class User < ActiveRecord::Base
  attr_accessible :birthdate, :image, :lastname, :mail, :name, :password, :password_confirmation
  has_many :posts
  has_many :comments

  validates_presence_of :lastname, :name

	validates :mail, :presence => true
 	validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
 	validates_uniqueness_of :mail
 	validates :password, :presence => true, :length => {:within => 6..40}
 	validates_confirmation_of :password

end

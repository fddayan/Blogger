class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :birthdate, :image, :lastname
  has_many :posts
  has_many :comments

  validates_presence_of :lastname, :name
	validates :email, :presence => true
 	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
 	validates_uniqueness_of :email
 	validates :password, :presence => true, :length => {:within => 6..40}
 	validates_confirmation_of :password

end

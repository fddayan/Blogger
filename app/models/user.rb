class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
   
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

  acts_as_followable
  acts_as_follower
  def get_followable_names
    result = []
    self.follows.each do |f|
        result << {:followable_id => f.followable_id, :followable_name => User.find(f.followable_id).name}
    end
    return result
  end

end

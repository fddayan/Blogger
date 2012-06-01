class Group < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :user
  
  has_many :post

  attr_accessible :description, :name, :user_id, :image

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

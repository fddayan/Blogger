class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user
  has_and_belongs_to_many :tags
  validates_presence_of :tags
end

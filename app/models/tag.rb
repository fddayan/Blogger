class Tag < ActiveRecord::Base
  attr_accessible :label
  has_and_belongs_to_many :posts
  scope :my_tags, lambda { |user_id| joins(:posts => :user).where(:users => {:id => user_id}) }

end

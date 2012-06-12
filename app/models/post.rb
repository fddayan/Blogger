class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :image
  belongs_to :user
  belongs_to :group
  has_many :comments

  scope :by_tag, lambda { |tag| Post.tagged_with(tag) if !(tag.empty?)}
	scope :by_keyword, lambda { |keyword| {:conditions=>['content LIKE ?', '%'+keyword+'%']} if !(keyword.empty?)}
	scope :by_created, lambda { |created| {:conditions=>['posts.created_at LIKE ?', '%'+created+'%']} if !(created.empty?)}
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  acts_as_taggable
end

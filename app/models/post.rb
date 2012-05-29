class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :tags
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  
  validates_presence_of :tags

	scope :by_tag, lambda { |tag| joins(:tags).where(:tags=>{:label=> tag} ).uniq if !(tag.empty?)}
	scope :by_keyword, lambda { |keyword| {:conditions=>['content LIKE ?', '%'+keyword+'%']} if !(keyword.empty?)}
	scope :by_created, lambda { |created| {:conditions=>['posts.created_at LIKE ?', '%'+created+'%']} if !(created.empty?)}
  
  def get_string_tags
    result_string=""
    primero = 1
    self.tags.each do |t|
    	if (primero==1) 
    		result_string = t.label
    		primero = 0
    	else
      	result_string =result_string+', '+t.label
    	end
    end
    return result_string
	end

end

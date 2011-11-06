class Micropost < ActiveRecord::Base
	belongs_to :users
	default_scope :order => 'microposts.created_at DESC'
	
	attr_accessible :title,:content,:category
	
	validates :user_id, :presence => true
	validates :title,    :presence => true,
						 :length => {:maximum =>500}							
	validates :content,  :presence => true,
						 :length => {:maximum =>3000}							
	validates :category, :presence => true


end

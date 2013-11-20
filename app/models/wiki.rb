class Wiki < ActiveRecord::Base
  attr_accessible :description, :subject

  has_many :articles
  has_many :users, through: :roles
  belongs_to :user
  

  default_scope order('created_at DESC')
end

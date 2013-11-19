class Wiki < ActiveRecord::Base
  attr_accessible :description, :subject

  has_many :articles
  belongs_to :user

  default_scope order('created_at DESC')
end

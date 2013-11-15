class Wiki < ActiveRecord::Base
  attr_accessible :description, :subject

  has_many :articles
end

class Article < ActiveRecord::Base
  attr_accessible :body, :title
 
  validates :title, length: {minimum: 5},presence: true
  validates :body, length: {minimum: 10},presence: true

end

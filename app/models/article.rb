class Article < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :wiki
 
  validates :title, length: {minimum: 5},presence: true
  validates :body, length: {minimum: 10},presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end

end

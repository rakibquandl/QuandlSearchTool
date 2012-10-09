class Classification < ActiveRecord::Base
  attr_accessible :value , :search_items
  has_many :search_items
end

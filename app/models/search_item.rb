class SearchItem < ActiveRecord::Base
  attr_accessible :name ,:file, :classification_id
  belongs_to :classification
  mount_uploader :file, SearchItemsUploader
end

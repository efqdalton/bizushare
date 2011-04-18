class BizuFile < ActiveRecord::Base
  has_attached_file :file

  belongs_to :bizu

  validates :name,    :presence => true
  validates :bizu_id, :presence => true
end

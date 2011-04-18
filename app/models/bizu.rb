class Bizu < ActiveRecord::Base
  has_many :bizu_files, :dependent => :destroy
  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :name,        :presence => true
  validates :category,    :presence => true
  validates :description, :presence => true

  searchable do
    text   :name, :default_boost => 2
    string :category
    text   :description
    text   :filename do
      bizu_files.map(&:name).join(' ')
    end
  end

end
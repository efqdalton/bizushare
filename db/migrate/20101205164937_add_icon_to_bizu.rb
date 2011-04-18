class AddIconToBizu < ActiveRecord::Migration
  def self.up
    add_column :bizus, :icon_file_name,    :string
    add_column :bizus, :icon_content_type, :string
    add_column :bizus, :icon_file_size,    :integer
    add_column :bizus, :icon_updated_at,   :datetime
  end

  def self.down
    remove_column :bizus, :icon_file_name
    remove_column :bizus, :icon_content_type
    remove_column :bizus, :icon_file_size
    remove_column :bizus, :icon_updated_at
  end
end

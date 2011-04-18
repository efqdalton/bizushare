class CreateBizuFiles < ActiveRecord::Migration
  def self.up
    create_table :bizu_files do |t|
      t.string :name
      t.references :bizu

      t.timestamps
    end
  end

  def self.down
    drop_table :bizu_files
  end
end

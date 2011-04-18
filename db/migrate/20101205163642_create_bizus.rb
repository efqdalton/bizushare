class CreateBizus < ActiveRecord::Migration
  def self.up
    create_table :bizus do |t|
      t.string :name
      t.string :category
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :bizus
  end
end

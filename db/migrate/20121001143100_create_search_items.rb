class CreateSearchItems < ActiveRecord::Migration
  def self.up
    create_table :search_items do |t|
      t.string :name
      t.integer :classification_id

      t.timestamps
    end
  end
  def self.down
    drop_table :search_items

  end
end

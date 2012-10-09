class AddFileToSearchItem < ActiveRecord::Migration
  def change
    add_column :search_items, :file, :string
  end
end

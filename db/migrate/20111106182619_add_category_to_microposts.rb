class AddCategoryToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :category, :string
    add_index :microposts, [:category]
  end
	
  def self.down
    remove_column :microposts, :category
  end
end

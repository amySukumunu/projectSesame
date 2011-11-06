class AddUserIdToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :user_id, :string
    add_index :microposts, [:user_id]
  end

  def self.down
    remove_column :microposts, :user_id
  end
end

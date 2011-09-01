class AddCategoryIdToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :category_id, :integer
  end

  def self.down
    remove_column :messages, :category_id
  end
end

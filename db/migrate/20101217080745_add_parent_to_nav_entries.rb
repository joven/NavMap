class AddParentToNavEntries < ActiveRecord::Migration
  def self.up
    add_column :nav_entries, :parent_id, :integer
  end

  def self.down
    remove_column :nav_entries, :parent_id
  end
end

class RemoveNavEntryFromNavEntries < ActiveRecord::Migration
  def self.up
    remove_column :nav_entries, :nav_entry_id
  end

  def self.down
    add_column :nav_entries, :nav_entry_id, :integer
  end
end

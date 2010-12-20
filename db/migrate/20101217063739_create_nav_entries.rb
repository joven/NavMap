class CreateNavEntries < ActiveRecord::Migration
  def self.up
    create_table :nav_entries do |t|
      t.integer :system_id
      t.integer :nav_entry_id
      t.integer :seq
      t.string :content
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :nav_entries
  end
end

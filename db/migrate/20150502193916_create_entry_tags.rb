class CreateEntryTags < ActiveRecord::Migration
  def change
    create_table :entry_tags do |t|
      t.references :entry
      t.references :tag

      t.timestamps null: false
    end
  end
end

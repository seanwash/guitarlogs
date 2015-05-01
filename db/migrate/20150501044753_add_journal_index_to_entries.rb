class AddJournalIndexToEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :journal, index: true, foreign_key: true
  end
end

class CreateEntryExercises < ActiveRecord::Migration
  def change
    create_table :entry_exercises do |t|
      t.references :entry, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

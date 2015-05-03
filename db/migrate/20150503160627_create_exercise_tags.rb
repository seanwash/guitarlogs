class CreateExerciseTags < ActiveRecord::Migration
  def change
    create_table :exercise_tags do |t|
      t.references :exercise, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

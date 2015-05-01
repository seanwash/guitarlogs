class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

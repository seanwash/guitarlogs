class AddUserIdToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :user, index: true, foreign_key: true
  end
end

class EntryExercise < ActiveRecord::Base
  belongs_to :entry
  belongs_to :exercise
end

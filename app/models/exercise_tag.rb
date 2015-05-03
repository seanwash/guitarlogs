class ExerciseTag < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :tag
end

class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :content, presence: true

  has_many :exercise_tags
  has_many :tags, through: :exercise_tags
end

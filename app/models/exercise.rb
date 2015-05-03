class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :content, presence: true

  has_many :exercise_tags
  has_many :tags, through: :exercise_tags

  has_many :entry_exercises
  has_many :entries, through: :entry_exercises

  belongs_to :user
end

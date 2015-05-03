class Entry < ActiveRecord::Base
  belongs_to :journal

  validates :content, presence: true
  validates :journal_id, presence: true

  has_many :entry_tags
  has_many :tags, through: :entry_tags, dependent: :destroy

  has_many :entry_exercises
  has_many :exercises, through: :entry_exercises
end

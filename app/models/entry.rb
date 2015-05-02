class Entry < ActiveRecord::Base
  belongs_to :journal

  validates :content, presence: true

  has_many :entry_tags
  has_many :tags, through: :entry_tags, dependent: :destroy
end

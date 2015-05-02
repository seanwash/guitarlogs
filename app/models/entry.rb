class Entry < ActiveRecord::Base
  belongs_to :journal

  has_many :entry_tags
  has_many :tags, through: :entry_tags, dependent: :destroy
end
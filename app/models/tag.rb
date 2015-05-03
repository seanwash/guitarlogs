class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :entry_tags
  has_many :entries, through: :entry_tags
end

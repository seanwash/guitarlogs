class Tag < ActiveRecord::Base
  has_many :entries, through: :entry_tags
end

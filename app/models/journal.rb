class Journal < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  has_many :entries
end

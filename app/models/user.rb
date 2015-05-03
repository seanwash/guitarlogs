class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :update

  has_one :journal
  has_many :entries, through: :journal

  # Always make sure that a user has a journal
  after_create :create_journal

  def create_journal
    Journal.create user: self
  end
end

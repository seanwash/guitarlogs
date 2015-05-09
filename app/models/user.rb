class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :update

  has_one :journal
  has_many :entries, through: :journal

  has_many :exercises

  # Make sure that emails are stored lowercase
  before_save :downcase_emails

  # Always make sure that a user has a journal
  after_create :create_journal

  def downcase_emails
    self.email = email.downcase
  end

  def create_journal
    Journal.create user: self
  end
end

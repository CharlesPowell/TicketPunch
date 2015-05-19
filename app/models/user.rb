class User < ActiveRecord::Base
  has_secure_password

  has_many :watch_list_entries
  has_many :movies, through: :watch_list_entries
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def to_s
    self.username
  end

end

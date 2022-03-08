class User < ApplicationRecord
  validates :name, presence: true
  validates :password, length: {in: 6..20}
  validates :password, confirmation: true
  validates :confirm_password, presence: true
  validates :email, uniqueness: true,presence: true
  validates :terms, acceptance: true
  validates :gender, presence: true
end

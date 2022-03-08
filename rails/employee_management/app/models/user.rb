class User < ApplicationRecord
  validates :name, presence: true
  validates :password, length: {in: 6..20}
  validates :password, confirmation: true
  validates :email, presence: true
  validates :terms, acceptance: true
  validates :gender, presence: true
  before_save :set_code

  def set_code
    self.code = rand(100000..999999)
  end
end

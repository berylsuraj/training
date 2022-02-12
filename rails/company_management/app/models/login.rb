class Login < ApplicationRecord
  belongs_to :employee
  validates :username, presence: true
  validates :password, length: { in: 6..20}
  validates :employee, prensece: true
end

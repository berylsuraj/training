class Department < ApplicationRecord
	has_many :employees
  validates :name, presence:true
  validates_associated :employees
  validates :name, format: { with: /\A[a-zA-Z]+\z/ }
end

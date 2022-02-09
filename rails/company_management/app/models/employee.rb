class Employee < ApplicationRecord
  validates :name, presence: true
  #validates :is_working, presence: true
  #validates :is_working, acceptance: {message: 'Must be true'}
  belongs_to :department
  has_one :accounts
  has_many :jobs
  has_many :companies, through: :jobs
end

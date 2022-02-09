class Employee < ApplicationRecord
  validates :name, presence: true
  validates :is_working, presence: true
  validates :is_working, acceptance: {message: 'Must be true'}
  belongs_to :department
end

class Employee < ApplicationRecord
  validates :name, presence: true
  #validates :is_working, presence: true
  #validates :is_working, acceptance: {message: 'Must be true'}
  belongs_to :department
  has_one :account
  has_one :account_history, through: :account
  has_many :jobs
  has_many :companies, through: :jobs
  has_many :projects
  has_many :projects, as: :projectable
end

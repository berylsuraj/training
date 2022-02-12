class Employee < ApplicationRecord
  validates :name, presence: true
  #validates :is_working, presence: true
  # validates :is_working, acceptance: true
  # validates :is_working, acceptance: {message: 'must be '}
  belongs_to :department
  has_one :account
  has_one :account_history, through: :account
  has_many :jobs
  has_many :companies, through: :jobs
  has_many :projects, as: :projectable
  scope :working, -> { where("is_working=?",true) }
  scope :salary_more_than, -> (salary) { where("salary >?",salary)}
  # validates :email, presence: true
  # validates :email_confirmation, presence: true
  # validates :email, confirmation: true
  has_one :login
  validates :salary, numericality: {only_integer: true}
  
end

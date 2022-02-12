class Account < ApplicationRecord
	belongs_to :employee
	has_one :account_history
  validates :employee_id, presence: true, uniqueness: true
  include ActiveModel::Validations
  validates_with MyValidator
end